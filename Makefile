# This makefile depends on Ubuntu 18.04, with Python 2.7

# Sim configuration
ARCH=ALPHA
L2_SIZE=2MB
MEM_MODEL=simple# or ruby
BENCHMARK=parsec_blackscholes
BENCHMARK_SIZE=test

# Utilities
M5_DIR=$(PWD)/m5_$(ARCH)
GEM5_DIR=$(PWD)/gem5
GEM5_EXEC=$(GEM5_DIR)/build/$(ARCH)/gem5.opt
TOPO_SCRIPT=$(GEM5_DIR)/configs/example/fs.py
SCRIPTS_DIR=scripts

# Derived variables
ifeq ($(MEM_MODEL), ruby)
	MEM_ARGS=--ruby --topology=Mesh_XY --mesh-rows=4
else
	MEM_ARGS=--mem-type=SimpleMemory
endif
ifeq ($(ARCH), ALPHA)
	RESTORE_CPU=
else
	RESTORE_CPU=--restore-with-cpu=TimingSimpleCPU
endif
CHECKPOINT_DIR=ckpt/ckpt_$(ARCH)_$(L2_SIZE)
TEST_DIR=test/test_$(ARCH)_$(L2_SIZE)_$(MEM_MODEL)_$(BENCHMARK)_$(BENCHMARK_SIZE)

# Environment config
export M5_PATH=$(M5_DIR)

# Functions

install_dependencies:
	echo "Installing dependencies"
	sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
		libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
		python-dev python-six python libboost-all-dev pkg-config
#	sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
#		libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
#		python3-dev python3-six python-is-python3 libboost-all-dev pkg-config \
#		libhdf5-serial-dev

get_gem5:
	echo "Cloning gem5"
	git clone --branch stable https://gem5.googlesource.com/public/gem5

compile_gem5:
	echo "Compiling gem5"
	cd $(GEM5_DIR) \
		&& git reset --hard 5cd4248672e5cd62cfec4753bd6d6ce666694f1f \
		&& scons $(GEM5_EXEC) PROCOTOL=MOESI_CMP_directory --ignore-style --jobs=4
		#&& git reset --hard 9fc9c67b4242c03f165951775be5cd0812f2a705 \

# https://superuser.com/questions/694430/how-to-inspect-disk-image
mount_img:
	mkdir -p /mnt/$(ARCH)_img
	sudo modprobe loop
	sudo mount -o loop,offset=32256 $(M5_DIR)/disks/linux.img /mnt/$(ARCH)_img
	echo "Mounted $(M5_DIR)/disks/linux.img to /mnt/$(ARCH)_img"

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
		--kernel=$(M5_DIR)/binaries/vmlinux \
		--disk-image=$(M5_DIR)/disks/linux.img \
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
	touch $(TEST_DIR)/RUN
	if ($(GEM5_EXEC) \
		--outdir=$(TEST_DIR) \
		$(TOPO_SCRIPT) \
		$(MEM_ARGS) \
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
		--kernel=$(M5_DIR)/binaries/vmlinux \
		--disk-image=$(M5_DIR)/disks/linux.img \
		-r 1 \
		$(RESTORE_CPU) \
		--script=$(SCRIPTS_DIR)/$(ARCH)/$(BENCHMARK)_$(BENCHMARK_SIZE).rcS \
		2>&1) > $(TEST_DIR)/sim_output; then touch $(TEST_DIR)/PASS; else touch $(TEST_DIR)/FAIL; fi
	echo `date +%s` >> $(TEST_DIR)/runtime.log
	$(SCRIPTS_DIR)/parse_results $(ARCH) $(L2_SIZE) $(MEM_MODEL) $(BENCHMARK) $(BENCHMARK_SIZE) >> stat_database
	rm $(TEST_DIR)/RUN

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
		--kernel=$(M5_DIR)/binaries/vmlinux \
		--disk-image=$(M5_DIR)/disks/linux.img \
		-r 1 \
		$(RESTORE_CPU) \
		;
