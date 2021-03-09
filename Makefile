# This makefile depends on Ubuntu 18.04, with Python 2.7

# Utilities
M5_DIR=$(PWD)/m5
GEM5_DIR=$(PWD)/gem5
GEM5_EXEC=$(GEM5_DIR)/build/X86/gem5.opt
TOPO_SCRIPT=$(GEM5_DIR)/configs/example/fs.py
SCRIPTS_DIR=scripts

# Sim configuration
L2_SIZE=2MB
MEM_MODEL=simple# or ruby
BENCHMARK=blackscholes
BENCHMARK_SIZE=test

# Derived variables
ifeq ($(MEM_MODEL), ruby)
	MEM_ARGS=--ruby --topology=Mesh_XY --mesh-rows=4 --debug-flags=Ruby
else
	MEM_ARGS=--mem-type=SimpleMemory
endif
CHECKPOINT_DIR=ckpt_$(L2_SIZE)
TEST_DIR=test_$(L2_SIZE)_$(MEM_MODEL)_$(BENCHMARK)_$(BENCHMARK_SIZE)

# Functions

install_dependencies:
	echo "Installing dependencies"
	sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
		libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
		python-dev python-six python libboost-all-dev pkg-config

compile_gem5:
	echo "Compiling gem5"
	git clone https://gem5.googlesource.com/public/gem5
	cd $(GEM5_DIR) \
		&& git reset --hard 9fc9c67b4242c03f165951775be5cd0812f2a705 \
		&& scons $(GEM5_EXEC) PROCOTOL=MOESI_CMP_directory --ignore-style

create_checkpoint:
	echo "Creating checkpoint $(CHECKPOINT_DIR)"
	rm -rf $(CHECKPOINT_DIR)
	mkdir -p $(CHECKPOINT_DIR)
	echo `date +%s` >> $(CHECKPOINT_DIR)/runtime.log
	($(GEM5_EXEC) \
		--outdir=$(CHECKPOINT_DIR) \
		$(TOPO_SCRIPT) \
		--num-cpus=16 \
		--num-dirs=16 \
		--num-l2caches=16 \
		--l1d_size=256kB \
		--l1i_size=256kB \
		--l2_size=$(L2_SIZE) \
		--l1d_assoc=8 \
		--l1i_assoc=8 \
		--l2_assoc=16 \
		--cacheline_size=64 \
		--kernel=$(M5_DIR)/binaries/vmlinux_5_6_2 \
		--disk-image=$(M5_DIR)/disks/linux_12G.img \
		--script=$(GEM5_DIR)/configs/boot/hack_back_ckpt.rcS \
		2>&1 || true) > $(CHECKPOINT_DIR)/sim_output
	echo `date +%s` >> $(CHECKPOINT_DIR)/runtime.log

# Content of --script will be executed automatically. Be sure to call /sbin/m5 exit to finish simulation cleanly.
# Otherwise, connect to the running simulation with:
#    telnet localhost 3456

run_sim:
	echo "Running simulation $(TEST_DIR)"
	rm -rf $(TEST_DIR)
	mkdir -p $(TEST_DIR)
	cp -r $(CHECKPOINT_DIR)/cpt.* $(TEST_DIR)/.
	echo `date +%s` >> $(TEST_DIR)/runtime.log
	($(GEM5_EXEC) \
		--outdir=$(TEST_DIR) \
		$(TOPO_SCRIPT) \
		$(MEM_ARGS) \
		--abs-max-tick=999999999999999999 \
		--num-cpus=16 \
		--num-dirs=16 \
		--num-l2caches=16 \
		--l1d_size=256kB \
		--l1i_size=256kB \
		--l2_size=$(L2_SIZE) \
		--l1d_assoc=8 \
		--l1i_assoc=8 \
		--l2_assoc=16 \
		--cacheline_size=64 \
		--kernel=$(M5_DIR)/binaries/vmlinux_5_6_2 \
		--disk-image=$(M5_DIR)/disks/linux_12G.img \
		-r 1 \
		--restore-with-cpu=TimingSimpleCPU \
		--script=$(SCRIPTS_DIR)/perf_$(BENCHMARK)_$(BENCHMARK_SIZE) \
		2>&1 || true) > $(TEST_DIR)/sim_output
	echo `date +%s` >> $(TEST_DIR)/runtime.log
	$(SCRIPTS_DIR)/parse_results $(L2_SIZE) $(MEM_MODEL) $(BENCHMARK) $(BENCHMARK_SIZE)

interactive:
	echo "Running interactive simulation $(TEST_DIR)"
	rm -rf $(TEST_DIR)
	mkdir -p $(TEST_DIR)
	cp -r $(CHECKPOINT_DIR)/cpt.* $(TEST_DIR)/.
	$(GEM5_EXEC) \
		--outdir=$(TEST_DIR) \
		$(TOPO_SCRIPT) \
		--mem-type=SimpleMemory \
		--num-cpus=16 \
		--num-dirs=16 \
		--num-l2caches=16 \
		--l1d_size=256kB \
		--l1i_size=256kB \
		--l2_size=$(L2_SIZE) \
		--l1d_assoc=8 \
		--l1i_assoc=8 \
		--l2_assoc=16 \
		--cacheline_size=64 \
		--kernel=$(M5_DIR)/binaries/vmlinux_5_6_2 \
		--disk-image=$(M5_DIR)/disks/linux_12G.img \
		-r 1 \
		--restore-with-cpu=TimingSimpleCPU \
		;
