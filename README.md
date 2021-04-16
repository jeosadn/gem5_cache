Note: Tested only on Ubuntu 18.04, Python 2.7

Directory Structure:
```
|-- gem5/ -> Checkout of gem5 repo. Download and compile automatically with:
|            make compile_gem5 ARCH=ALPHA (also ARCH=X86 is supported)
|-- m5_<ARCH> -> Large files not included in the repo. Support for ALPHA and X86 architectures
|   |-- binaries
|   |   |-- console -> Only required for ALPHA, console binary
|   |   |-- ts_osfpal -> Only required for ALPHA, Tsunami binary patch
|   |   `-- vmlinux -> Linux kernel used by simulator
|   `-- disks
|       |-- linux-bigswap2.img -> Swap disk
|       `-- linux.img -> Linux drive image. Contains compiled binaries of PARSEC benchmark
|-- scripts
|   |-- parse_results -> Script to parse simulation results.
|   |                    Results are saved in csv format in stat_database
|   `-- <ARCH> -> Scripts that simulation loads to execute benchmarks
|-- stat_database -> Results of previous simulation runs
|-- ckpt -> directory to hold checkpoints of simulation post-initialization
|-- test -> directory to hold output of simulation results
`-- runner.sh -> Script to run multiple simulations in parallel
```

Make commands:
- install\_dependencies: Runs apt with list of programs required to build and run Gem5
- compile\_gem5: Compiles gem5 for a given architecture. (default: ARCH=ALPHA)
- mount\_img: Mounts Linux disk image for browsing. Only ALPHA is supported
- create\_checkpoint: Runs Gem5 until init is done. Takes ARCH and L2\_SIZE arguments
- run\_sim: Runs Gem5 from a checkpoint with a given benchmark. Takes ARCH, L2\_SIZE, MEM\_MODEL, BENCHMARK and BENCHMARK\_SIZE arguments
- interactive: Launches Gem5 from a checkpoint without a script. Connect with `telnet 3456`

Example commands:
- `make compile_gem5 ARCH=ALPHA`
- `make create_checkpoint ARCH=ALPHA L2_SIZE=2MB`
- `make run_sim ARCH=ALPHA L2_SIZE=2MB MEM_MODEL=simple BENCHMARK_SIZE=test BENCHMARK=parsec_blackscholes`

Stat database csv format is as follows:
`ARCH,L2_SIZE,MEM_MODEL,BENCHMARK,BENCHMARK_SIZE,PASS/FAIL,COMMENT`
