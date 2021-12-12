# XDC constraints for the Digilent Arty board
# part: xc7a100t-csg324-1

# General configuration
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# 100 MHz clock
set_property -dict {LOC E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name clk [get_ports clk]

# LEDs
set_property -dict {LOC H17 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led0_r]
set_property -dict {LOC K15 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led0_g]
set_property -dict {LOC J13 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led0_b]
set_property -dict {LOC N14 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led1_r]
set_property -dict {LOC R18 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led1_g]
set_property -dict {LOC V17 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led1_b]
set_property -dict {LOC U17 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led2_r]
set_property -dict {LOC U16 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led2_g]
set_property -dict {LOC V16 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led2_b]
set_property -dict {LOC T15 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led3_r]
set_property -dict {LOC U14 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led3_g]
set_property -dict {LOC T16 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led3_b]
set_property -dict {LOC V15 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led4]
set_property -dict {LOC V14 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led5]
set_property -dict {LOC V12 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led6]
set_property -dict {LOC V11 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports led7]

set_false_path -to [get_ports {led0_r led0_g led0_b led1_r led1_g led1_b led2_r led2_g led2_b led3_r led3_g led3_b led4 led5 led6 led7}]
set_output_delay 0.000 [get_ports {led0_r led0_g led0_b led1_r led1_g led1_b led2_r led2_g led2_b led3_r led3_g led3_b led4 led5 led6 led7}]

# Reset button
set_property -dict {LOC C12 IOSTANDARD LVCMOS33} [get_ports reset_n]

set_false_path -from [get_ports reset_n]
set_input_delay 0.000 [get_ports reset_n]

# Push buttons
set_property -dict {LOC P17 IOSTANDARD LVCMOS33} [get_ports {btn[0]}]
set_property -dict {LOC M18 IOSTANDARD LVCMOS33} [get_ports {btn[1]}]
set_property -dict {LOC M17 IOSTANDARD LVCMOS33} [get_ports {btn[2]}]
set_property -dict {LOC P18 IOSTANDARD LVCMOS33} [get_ports {btn[3]}]

set_false_path -from [get_ports {btn[*]}]
set_input_delay 0.000 [get_ports {btn[*]}]

# Toggle switches
set_property -dict {LOC J15 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
set_property -dict {LOC L16 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
set_property -dict {LOC M13 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
set_property -dict {LOC R15 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]

set_false_path -from [get_ports {sw[*]}]
set_input_delay 0.000 [get_ports {sw[*]}]

# GPIO
# PMOD JA
#set_property -dict {LOC G13  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja1}] ;# PMOD JA pin 1
#set_property -dict {LOC B11  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja2}] ;# PMOD JA pin 2
#set_property -dict {LOC A11  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja3}] ;# PMOD JA pin 3
#set_property -dict {LOC D12  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja4}] ;# PMOD JA pin 4
#set_property -dict {LOC D13  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja7}] ;# PMOD JA pin 7
#set_property -dict {LOC B18  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja8}] ;# PMOD JA pin 8
#set_property -dict {LOC A18  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja9}] ;# PMOD JA pin 9
#set_property -dict {LOC K16  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_ja10}] ;# PMOD JA pin 10
# PMOD JB
#set_property -dict {LOC E15  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb1}] ;# PMOD JB pin 1
#set_property -dict {LOC E16  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb2}] ;# PMOD JB pin 2
#set_property -dict {LOC D15  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb3}] ;# PMOD JB pin 3
#set_property -dict {LOC C15  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb4}] ;# PMOD JB pin 4
#set_property -dict {LOC J17  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb7}] ;# PMOD JB pin 7
#set_property -dict {LOC J18  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb8}] ;# PMOD JB pin 8
#set_property -dict {LOC K15  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb9}] ;# PMOD JB pin 9
#set_property -dict {LOC J15  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jb10}] ;# PMOD JB pin 10
# PMOD JC
#set_property -dict {LOC U12  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc1}] ;# PMOD JC pin 1
#set_property -dict {LOC V12  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc2}] ;# PMOD JC pin 2
#set_property -dict {LOC V10  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc3}] ;# PMOD JC pin 3
#set_property -dict {LOC V11  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc4}] ;# PMOD JC pin 4
#set_property -dict {LOC U14  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc7}] ;# PMOD JC pin 7
#set_property -dict {LOC V14  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc8}] ;# PMOD JC pin 8
#set_property -dict {LOC T13  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc9}] ;# PMOD JC pin 9
#set_property -dict {LOC U13  IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jc10}] ;# PMOD JC pin 10
# PMOD JD
#set_property -dict {LOC D4   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd1}] ;# PMOD JD pin 1
#set_property -dict {LOC D3   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd2}] ;# PMOD JD pin 2
#set_property -dict {LOC F4   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd3}] ;# PMOD JD pin 3
#set_property -dict {LOC F3   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd4}] ;# PMOD JD pin 4
#set_property -dict {LOC E2   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd7}] ;# PMOD JD pin 7
#set_property -dict {LOC D2   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd8}] ;# PMOD JD pin 8
#set_property -dict {LOC H2   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd9}] ;# PMOD JD pin 9
#set_property -dict {LOC G2   IOSTANDARD LVCMOS33 SLEW FAST DRIVE 12} [get_ports {gpio_jd10}] ;# PMOD JD pin 10

# UART
set_property -dict {LOC C4 IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports uart_txd]
set_property -dict {LOC D4 IOSTANDARD LVCMOS33} [get_ports uart_rxd]

set_false_path -to [get_ports uart_txd]
set_output_delay 0.000 [get_ports uart_txd]
set_false_path -from [get_ports uart_rxd]
set_input_delay 0.000 [get_ports uart_rxd]


#Ethernet MII PHY
#set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC }]; #IO_L11P_T1_SRCC_16 Sch=eth_mdc
#set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDIO }]; #IO_L14N_T2_SRCC_16 Sch=eth_mdio

set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports phy_reset_n]
set_property -dict {PACKAGE_PIN D9 IOSTANDARD LVCMOS33} [get_ports phy_rmii_crsdv]
set_property -dict {PACKAGE_PIN C10 IOSTANDARD LVCMOS33} [get_ports phy_rmii_rxer]
set_property -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS33} [get_ports {phy_rmii_rxd[0]}]
set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports {phy_rmii_rxd[1]}]
set_property -dict {PACKAGE_PIN B9 IOSTANDARD LVCMOS33} [get_ports phy_rmii_txen]
set_property -dict {PACKAGE_PIN A10 IOSTANDARD LVCMOS33} [get_ports {phy_rmii_txd[0]}]
set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS33} [get_ports {phy_rmii_txd[1]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports phy_ref_clk]
#set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN }]; #IO_L12P_T1_MRCC_16 Sch=eth_intn



# create_clock -period 40.000 -name phy_rx_clk [get_ports phy_rx_clk]
# create_clock -period 40.000 -name phy_tx_clk [get_ports phy_tx_clk]

set_false_path -to [get_ports {phy_ref_clk phy_reset_n}]
set_output_delay 0.000 [get_ports {phy_ref_clk phy_reset_n}]

#set_false_path -to [get_ports {phy_mdio phy_mdc}]
#set_output_delay 0 [get_ports {phy_mdio phy_mdc}]
#set_false_path -from [get_ports {phy_mdio}]
#set_input_delay 0 [get_ports {phy_mdio}]


set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[0]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[1]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[2]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[3]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[4]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[5]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[6]}]
set_property MARK_DEBUG false [get_nets {core_inst/rx_axis_tdata[7]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[0]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[1]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[2]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[3]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[4]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[5]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[6]}]
set_property MARK_DEBUG false [get_nets {core_inst/tx_axis_tdata[7]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[0]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[1]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[2]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[3]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[4]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[5]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[6]}]
set_property MARK_DEBUG true [get_nets {core_inst/tx_udp_payload_axis_tdata[7]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[0]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[1]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[2]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[3]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[4]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[5]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[6]}]
set_property MARK_DEBUG true [get_nets {core_inst/rx_udp_payload_axis_tdata[7]}]
set_property MARK_DEBUG true [get_nets core_inst/rx_fifo_udp_payload_axis_tvalid]
set_property MARK_DEBUG true [get_nets core_inst/tx_udp_payload_axis_tvalid]
set_property MARK_DEBUG true [get_nets core_inst/tx_udp_payload_axis_tready]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[0]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[1]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[2]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[3]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[4]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[5]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[6]}]
set_property MARK_DEBUG false [get_nets {core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tdata[7]}]
set_property MARK_DEBUG false [get_nets core_inst/udp_complete_inst/udp_rx_ip_payload_axis_tready]
set_property MARK_DEBUG false [get_nets core_inst/udp_complete_inst/udp_rx_ip_payload_axis_tvalid]
set_property MARK_DEBUG false [get_nets core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tlast]
set_property MARK_DEBUG false [get_nets core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tuser]
set_property MARK_DEBUG false [get_nets core_inst/udp_complete_inst/udp_tx_ip_payload_axis_tvalid]
set_property MARK_DEBUG true [get_nets core_inst/tx_udp_payload_axis_tlast]
set_property MARK_DEBUG true [get_nets core_inst/rx_udp_payload_axis_tlast]
set_property MARK_DEBUG true [get_nets core_inst/rx_udp_payload_axis_tready]
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_int]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {core_inst/tx_udp_payload_axis_tdata[0]} {core_inst/tx_udp_payload_axis_tdata[1]} {core_inst/tx_udp_payload_axis_tdata[2]} {core_inst/tx_udp_payload_axis_tdata[3]} {core_inst/tx_udp_payload_axis_tdata[4]} {core_inst/tx_udp_payload_axis_tdata[5]} {core_inst/tx_udp_payload_axis_tdata[6]} {core_inst/tx_udp_payload_axis_tdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {core_inst/rx_udp_payload_axis_tdata[0]} {core_inst/rx_udp_payload_axis_tdata[1]} {core_inst/rx_udp_payload_axis_tdata[2]} {core_inst/rx_udp_payload_axis_tdata[3]} {core_inst/rx_udp_payload_axis_tdata[4]} {core_inst/rx_udp_payload_axis_tdata[5]} {core_inst/rx_udp_payload_axis_tdata[6]} {core_inst/rx_udp_payload_axis_tdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list core_inst/rx_fifo_udp_payload_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list core_inst/rx_udp_payload_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list core_inst/rx_udp_payload_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list core_inst/tx_udp_payload_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list core_inst/tx_udp_payload_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list core_inst/tx_udp_payload_axis_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_int]
