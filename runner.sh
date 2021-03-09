#!/bin/bash

#------------------------------------------------------------------------------
# Checkpoint creation
#------------------------------------------------------------------------------

make create_checkpoint L2_SIZE=2MB
make create_checkpoint L2_SIZE=64B

commands="
# Simple, test size, 2MB cache
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=ferret BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=raytrace BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=vips BENCHMARK_SIZE=test

# Ruby, test size, 2MB cache
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=blackscholes BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=canneal BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=dedup BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=ferret BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=raytrace BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=vips BENCHMARK_SIZE=test

# Simple, test size, 64B cache
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=ferret BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=raytrace BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=vips BENCHMARK_SIZE=test

# Ruby, test size, 64B cache
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=blackscholes BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=canneal BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=dedup BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=ferret BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=raytrace BENCHMARK_SIZE=test
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=vips BENCHMARK_SIZE=test

# Simple, simsmall size, 2MB cache
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=ferret BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=raytrace BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=vips BENCHMARK_SIZE=simsmall

# Ruby, simsmall size, 2MB cache
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=blackscholes BENCHMARK_SIZE=simsmall # This one failed, possible deadlock detected abort
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=canneal BENCHMARK_SIZE=simsmall # This one failed, running...
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=dedup BENCHMARK_SIZE=simsmall # This one failed, stats.txt one entry
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=ferret BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=raytrace BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=vips BENCHMARK_SIZE=simsmall

# Simple, simsmall size, 64B cache
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=ferret BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=raytrace BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=vips BENCHMARK_SIZE=simsmall

# Ruby, simsmall size, 64B cache
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=blackscholes BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=canneal BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=dedup BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=ferret BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=raytrace BENCHMARK_SIZE=simsmall
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=vips BENCHMARK_SIZE=simsmall

## Simple, simmedium size, 2MB cache
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=ferret BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=raytrace BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=vips BENCHMARK_SIZE=simmedium
#
## Ruby, simmedium size, 2MB cache
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=blackscholes BENCHMARK_SIZE=simmedium # This one failed, possible deadlock detected abort
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=canneal BENCHMARK_SIZE=simmedium # This one failed, running...
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=dedup BENCHMARK_SIZE=simmedium # This one failed, stats.txt one entry
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=ferret BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=raytrace BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK=vips BENCHMARK_SIZE=simmedium
#
## Simple, simmedium size, 64B cache
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=ferret BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=raytrace BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK=vips BENCHMARK_SIZE=simmedium
#
## Ruby, simmedium size, 64B cache
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=blackscholes BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=canneal BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=dedup BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=ferret BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=raytrace BENCHMARK_SIZE=simmedium
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK=vips BENCHMARK_SIZE=simmedium
"

echo "$commands" | xargs -I % --max-procs=4 bash -c %

exit 0
