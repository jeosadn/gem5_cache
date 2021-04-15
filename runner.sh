#!/bin/bash

#------------------------------------------------------------------------------
# Checkpoint creation
#------------------------------------------------------------------------------

#make create_checkpoint L2_SIZE=2MB
#make create_checkpoint L2_SIZE=64B

commands="
# blackscholes
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes

# bodytrack
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack

# canneal
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal

# dedup
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup

# facesim
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim

# ferret
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret

# fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate

# freqmine
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine

# streamcluster
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster

# swaptions
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions

# vips
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips

# x264
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264

# rtview
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test     BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_rtview
"

echo "$commands" | xargs -I % --max-procs=4 bash -c %

exit 0
