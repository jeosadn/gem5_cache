#make create_checkpoint L2_SIZE=2MB CHECKPOINT_DIR=checkpoint_2MB
#make create_checkpoint L2_SIZE=64B CHECKPOINT_DIR=checkpoint_64B
#make run_sim_simple L2_SIZE=2MB CHECKPOINT_DIR=checkpoint_2MB TEST_DIR=test_2MB_simple
#make run_sim_simple L2_SIZE=64B CHECKPOINT_DIR=checkpoint_64B TEST_DIR=test_64B_simple
#make run_sim_ruby L2_SIZE=2MB CHECKPOINT_DIR=checkpoint_2MB TEST_DIR=test_2MB_ruby
#make run_sim_ruby L2_SIZE=64B CHECKPOINT_DIR=checkpoint_64B TEST_DIR=test_64B_ruby

make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=blackscholes BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=canneal BENCHMARK_SIZE=test
make run_sim L2_SIZE=2MB MEM_MODEL=simple BENCHMARK=dedup BENCHMARK_SIZE=test
