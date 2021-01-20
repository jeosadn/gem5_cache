# This makefile depends on Ubuntu 18.04, with Python 2.7

M5_DIR=$(PWD)/m5
GEM5_DIR=$(PWD)/gem5
GEM5_EXEC=$(GEM5_DIR)/build/X86/gem5.opt
CHECKPOINT_DIR=checkpoint
TEST_DIR=16core_parsec_test

install_dependencies:
	sudo apt install build-essential git m4 scons zlib1g zlib1g-dev \
		libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
		python-dev python-six python libboost-all-dev pkg-config

compile_gem5:
	git clone https://gem5.googlesource.com/public/gem5
	cd $(GEM5_DIR) \
		&& git reset --hard 9fc9c67b4242c03f165951775be5cd0812f2a705 \
		&& scons $(GEM5_EXEC) PROCOTOL=MOESI_CMP_directory --ignore-style

create_checkpoint:
	$(GEM5_EXEC) \
		--outdir=$(CHECKPOINT_DIR) \
		$(GEM5_DIR)/configs/example/fs.py \
		--num-cpus=16 \
		--num-dirs=16 \
		--num-l2caches=16 \
		--l1d_size=256kB \
		--l1i_size=256kB \
		--l2_size=2MB \
		--l1d_assoc=8 \
		--l1i_assoc=8 \
		--l2_assoc=16 \
		--cacheline_size=64 \
		--kernel=$(M5_DIR)/binaries/vmlinux_5_6_2 \
		--disk-image=$(M5_DIR)/disks/linux_12G.img \
		--script=$(GEM5_DIR)/configs/boot/hack_back_ckpt.rcS
	mkdir -p $(TEST_DIR)
	cp -r $(CHECKPOINT_DIR)/cpt.* $(TEST_DIR)/.

run_sim:
	$(GEM5_EXEC) \
		--outdir=$(TEST_DIR) \
		$(GEM5_DIR)/configs/example/fs.py \
		--ruby \
		--topology=Mesh_XY \
		--mesh-rows=4 \
		--num-cpus=16 \
		--num-dirs=16 \
		--num-l2caches=16 \
		--l1d_size=256kB \
		--l1i_size=256kB \
		--l2_size=2MB \
		--l1d_assoc=8 \
		--l1i_assoc=8 \
		--l2_assoc=16 \
		--cacheline_size=64 \
		--kernel=$(M5_DIR)/binaries/vmlinux_5_6_2 \
		--disk-image=$(M5_DIR)/disks/linux_12G.img \
		-r 1 \
		--restore-with-cpu=TimingSimpleCPU

# This can be used to execute tests automatically in above command
#    --script=$(M5_DIR)/gem5_1_30_2020/gem5/16core_parsec.rcS \
# Otherwise, connect to the running simulation with:
# telnet localhost 3456
