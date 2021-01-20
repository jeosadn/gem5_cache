import m5
from m5.objects import *
from caches import *

### Option handling

from argparse import ArgumentParser

parser = ArgumentParser(description="Execute basic hello world simulation")
parser.add_argument("-g", help="Path to gem5 directory", default="gem5")
args = parser.parse_args()
gem5_dir = args.g

# Instantiate simulation system
system = System()

# Create clock and power domain
system.clk_domain = SrcClockDomain()
system.clk_domain.clock = "1GHz"
system.clk_domain.voltage_domain = VoltageDomain()

# Configure memory system
system.mem_mode = "timing"
system.mem_ranges = [AddrRange("512MB")]

# Configure CPU simulation
system.cpu = TimingSimpleCPU()

# L1 caches
system.cpu.icache = L1ICache()
system.cpu.dcache = L1DCache()
system.cpu.icache.connectCPU(system.cpu)
system.cpu.dcache.connectCPU(system.cpu)

# Cache interconnect
system.l2bus = L2XBar()
system.cpu.icache.connectBus(system.l2bus)
system.cpu.dcache.connectBus(system.l2bus)

# Configure memory bus
system.membus = SystemXBar()

# L2 cache
system.l2cache = L2Cache()
system.l2cache.connectCPUSideBus(system.l2bus)
system.l2cache.connectMemSideBus(system.membus)

# Connect other important ports (mainly for x86)
system.cpu.createInterruptController()
system.cpu.interrupts[0].pio = system.membus.master
system.cpu.interrupts[0].int_master = system.membus.slave
system.cpu.interrupts[0].int_slave = system.membus.master
system.system_port = system.membus.slave

# Configure memory controller
system.mem_ctrl = DDR3_1600_8x8()
system.mem_ctrl.range = system.mem_ranges[0]
system.mem_ctrl.port = system.membus.master

# System is configured! Now to run some code...
process = Process()
process.cmd = ["{}/tests/test-progs/hello/bin/x86/linux/hello".format(gem5_dir)]
system.cpu.workload = process
system.cpu.createThreads()

root = Root(full_system=False, system=system)
m5.instantiate()

print("Beginning simulation!")
exit_event = m5.simulate()

print("Exiting @ tick {} because {}".format(m5.curTick(), exit_event.getCause()))
