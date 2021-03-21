#!/bin/bash

#------------------------------------------------------------------------------
# Checkpoint creation
#------------------------------------------------------------------------------

#make create_checkpoint L2_SIZE=2MB
#make create_checkpoint L2_SIZE=64B

commands="
#                    2MB,          simple,               test
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
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_streamcluster # This benchmark hangs forever
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

#                    2MB,          ruby,               test
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_canneal
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_dedup
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_facesim
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_ferret
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_netferret
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_vips
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_x264
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_fft
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_radix
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_waterspatial

#                    64B,          simple,               test
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_canneal
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_dedup
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_facesim
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_ferret
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_netferret
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_vips
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_x264
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_fft
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_radix
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=splash2x_waterspatial

#                    64B,          ruby                test
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_canneal
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_dedup
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_facesim
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_ferret
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_netferret
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_vips
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=parsec_x264
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_fft
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_radix
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=test BENCHMARK=splash2x_waterspatial

#                    2MB,          simple,               simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netferret
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fft
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radix
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waterspatial

#                    2MB,          ruby,               simsmall
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netferret
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fft
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radix
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=2MB MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waterspatial

#                    64B,          simple,               simsmall
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netferret
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fft
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radix
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=64B MEM_MODEL=simple BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waterspatial

#                    64B,          ruby,               simsmall
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_blackscholes
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_bodytrack
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_canneal
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_dedup
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_facesim
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_ferret
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_fluidanimate
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_freqmine
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netdedup
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netferret
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_netstreamcluster
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_raytrace
#make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_streamcluster # This benchmark hangs forever
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_swaptions
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_vips
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=parsec_x264
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_barnes
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_cholesky
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fft
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_fmm
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_lucb
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_luncb
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceancp
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_oceanncp
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radiosity
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_radix
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_raytrace
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_volrend
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waternsquared
make run_sim L2_SIZE=64B MEM_MODEL=ruby BENCHMARK_SIZE=simsmall BENCHMARK=splash2x_waterspatial
"

echo "$commands" | xargs -I % --max-procs=4 bash -c %

exit 0
