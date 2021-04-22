#!/bin/bash

#------------------------------------------------------------------------------
# Checkpoint creation
#------------------------------------------------------------------------------

#make create_checkpoint ARCH=X86 L2_SIZE=2MB
#make create_checkpoint ARCH=X86 L2_SIZE=64B

commands="
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple   BENCHMARK_SIZE=test     BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple   BENCHMARK_SIZE=test     BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple   BENCHMARK_SIZE=test     BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple   BENCHMARK_SIZE=test     BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple   BENCHMARK_SIZE=test     BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple   BENCHMARK_SIZE=test     BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=simple   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_rtview

make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=ruby   BENCHMARK_SIZE=test     BENCHMARK=parsec_rtview
make run_sim ARCH=ALPHA L2_SIZE=64B MEM_MODEL=ruby   BENCHMARK_SIZE=simsmall BENCHMARK=parsec_rtview
"

echo "$commands" | xargs -I % --max-procs=12 bash -c %

exit 0
