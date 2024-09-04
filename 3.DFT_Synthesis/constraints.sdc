set PERIOD  7.0
set INPUT_DELAY  1.0
set OUTPUT_DELAY  1.0
set CLOCK_LATENCY 1.5
set MIN_IO_DELAY 1.0
set MAX_TRANSITION 0.5

## CLOCK BASICS
create_clock -name "clk" -period $PERIOD [get_ports clk]
set_clock_latency $CLOCK_LATENCY [get_clocks clk]
set_clock_uncertainty 0.3 [get_clocks clk]
set_clock_transition 0.4 [get_clocks clk]

## GROUPING
group_path  -name CLOCK\
            -to clock\
            -weight 1

group_path  -name INPUTS\
            -through [all_inputs]\
            -weight 1

group_path  -name OUTPUTS\
            -to [all_outputs]\
            -weight 1

## IN/OUT
set INPUTPORTS [remove_from_collection [all_inputs] [get_ports clk]]
set OUTPUTPORTS [all_outputs]
  
set_input_delay -clock "clk" -max $INPUT_DELAY $INPUTPORTS 
set_output_delay -clock "clk" -max $OUTPUT_DELAY $OUTPUTPORTS
set_input_delay -clock "clk" -min $MIN_IO_DELAY $INPUTPORTS 
set_output_delay -clock "clk" -min $MIN_IO_DELAY $OUTPUTPORTS

## DRC
set_max_transition $MAX_TRANSITION [current_design]
set_max_capacitance 100 [current_design]
set_max_fanout 200 [current_design]


