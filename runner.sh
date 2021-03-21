#!/bin/bash

#------------------------------------------------------------------------------
# Checkpoint creation
#------------------------------------------------------------------------------

#make create_checkpoint L2_SIZE=2MB
#make create_checkpoint L2_SIZE=64B

commands="
# Simple, test size, 2MB cache
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_canneal
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_dedup
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_facesim
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_ferret
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_netferret
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_raytrace
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_streamcluster
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_vips
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_x264
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_fft
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_radix
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_waterspatial

# Ruby, test size, 2MB cache

# Simple, test size, 64B cache

# Ruby, test size, 64B cache

# Simple, simsmall size, 2MB cache

# Ruby, simsmall size, 2MB cache

# Simple, simsmall size, 64B cache

# Ruby, simsmall size, 64B cache
"

echo "$commands" | xargs -I % --max-procs=4 bash -c %

exit 0
