#!/bin/sh

# Set up M5 path
export M5_PATH=$PWD/m5
echo "Setting up m5 path: $M5_PATH"

# Create checkpoint
cd gem5
echo "Creating checkpoint"
./build/X86/gem5.opt \
    --outdir=checkpoint \
    configs/example/fs.py \
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
    --kernel=$M5_PATH/binaries/vmlinux_5_6_2 \
    --disk-image=$M5_PATH/disks/linux_12G.img \
    --script=configs/boot/hack_back_ckpt.rcS

mkdir 16core_parsec_test
cp -r checkpoint/cpt.* 16core_parsec_test/.

# Remove ruby option for faster sim
./build/X86/gem5.opt \
    --outdir=16core_parsec_test \
    configs/example/fs.py \
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
    --kernel=$M5_PATH/binaries/vmlinux_5_6_2 \
    --disk-image=$M5_PATH/disks/linux_12G.img \
    -r 1 \
    --restore-with-cpu=TimingSimpleCPU

# Connect to running sim
telnet localhost 3456
