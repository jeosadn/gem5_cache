# This makefile depends on Ubuntu 18.04, with Python 2.7

M5_DIR=$(PWD)/m5
GEM5_DIR=$(PWD)/gem5
GEM5_EXEC=$(GEM5_DIR)/build/X86/gem5.opt
TOPO_SCRIPT=$(GEM5_DIR)/configs/example/fs.py
CHECKPOINT_DIR=checkpoint
TEST_DIR=test
SCRIPTS_DIR=scripts
L2_SIZE=2MB

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

# The configuration currently in use:
#   Uses atomic cpu, doesn't simulate instruction timing execution

create_checkpoint:
	echo "Creating checkpoint with L2_SIZE=$(L2_SIZE), CHECKPOINT_DIR=$(CHECKPOINT_DIR)"
	$(GEM5_EXEC) \
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
		;

# Running with ruby:
#   The more accurate cache simulation takes --ruby, --topology and --mesh-rows for simulation:
#		--ruby \
#		--topology=Mesh_XY \
#		--mesh-rows=4 \
#   Otherwise, use simplememory:
#		--mem-type=SimpleMemory \

run_sim_simple:
	echo "Running simple simulation with L2_SIZE=$(L2_SIZE), CHECKPOINT_DIR=$(CHECKPOINT_DIR), TEST_DIR=$(TEST_DIR)"
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
		--script=$(SCRIPTS_DIR)/runscript \
		;

run_sim_ruby:
	echo "Running ruby simulation with L2_SIZE=$(L2_SIZE), CHECKPOINT_DIR=$(CHECKPOINT_DIR), TEST_DIR=$(TEST_DIR)"
	rm -rf $(TEST_DIR)
	mkdir -p $(TEST_DIR)
	cp -r $(CHECKPOINT_DIR)/cpt.* $(TEST_DIR)/.
	$(GEM5_EXEC) \
		--outdir=$(TEST_DIR) \
		$(TOPO_SCRIPT) \
		--ruby \
		--topology=Mesh_XY \
		--mesh-rows=4 \
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
		--script=$(SCRIPTS_DIR)/runscript \
		;

interactive:
	echo "Running interactive simulation with L2_SIZE=$(L2_SIZE), CHECKPOINT_DIR=$(CHECKPOINT_DIR), TEST_DIR=$(TEST_DIR)"
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

# Content of --script will be executed automatically. Be sure to call /sbin/m5 exit to finish simulation cleanly.
# Otherwise, connect to the running simulation with:
#    telnet localhost 3456

simple:
	$(GEM5_EXEC) \
		--outdir=test_simple \
		$(SCRIPTS_DIR)/simple.py \
		;

two_level:
	$(GEM5_EXEC) \
		--outdir=test_two_level \
		$(SCRIPTS_DIR)/two_level.py \
		;



