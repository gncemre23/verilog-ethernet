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



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_int]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 80 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {core_inst/session[0]} {core_inst/session[1]} {core_inst/session[2]} {core_inst/session[3]} {core_inst/session[4]} {core_inst/session[5]} {core_inst/session[6]} {core_inst/session[7]} {core_inst/session[8]} {core_inst/session[9]} {core_inst/session[10]} {core_inst/session[11]} {core_inst/session[12]} {core_inst/session[13]} {core_inst/session[14]} {core_inst/session[15]} {core_inst/session[16]} {core_inst/session[17]} {core_inst/session[18]} {core_inst/session[19]} {core_inst/session[20]} {core_inst/session[21]} {core_inst/session[22]} {core_inst/session[23]} {core_inst/session[24]} {core_inst/session[25]} {core_inst/session[26]} {core_inst/session[27]} {core_inst/session[28]} {core_inst/session[29]} {core_inst/session[30]} {core_inst/session[31]} {core_inst/session[32]} {core_inst/session[33]} {core_inst/session[34]} {core_inst/session[35]} {core_inst/session[36]} {core_inst/session[37]} {core_inst/session[38]} {core_inst/session[39]} {core_inst/session[40]} {core_inst/session[41]} {core_inst/session[42]} {core_inst/session[43]} {core_inst/session[44]} {core_inst/session[45]} {core_inst/session[46]} {core_inst/session[47]} {core_inst/session[48]} {core_inst/session[49]} {core_inst/session[50]} {core_inst/session[51]} {core_inst/session[52]} {core_inst/session[53]} {core_inst/session[54]} {core_inst/session[55]} {core_inst/session[56]} {core_inst/session[57]} {core_inst/session[58]} {core_inst/session[59]} {core_inst/session[60]} {core_inst/session[61]} {core_inst/session[62]} {core_inst/session[63]} {core_inst/session[64]} {core_inst/session[65]} {core_inst/session[66]} {core_inst/session[67]} {core_inst/session[68]} {core_inst/session[69]} {core_inst/session[70]} {core_inst/session[71]} {core_inst/session[72]} {core_inst/session[73]} {core_inst/session[74]} {core_inst/session[75]} {core_inst/session[76]} {core_inst/session[77]} {core_inst/session[78]} {core_inst/session[79]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {core_inst/seq_num[0]} {core_inst/seq_num[1]} {core_inst/seq_num[2]} {core_inst/seq_num[3]} {core_inst/seq_num[4]} {core_inst/seq_num[5]} {core_inst/seq_num[6]} {core_inst/seq_num[7]} {core_inst/seq_num[8]} {core_inst/seq_num[9]} {core_inst/seq_num[10]} {core_inst/seq_num[11]} {core_inst/seq_num[12]} {core_inst/seq_num[13]} {core_inst/seq_num[14]} {core_inst/seq_num[15]} {core_inst/seq_num[16]} {core_inst/seq_num[17]} {core_inst/seq_num[18]} {core_inst/seq_num[19]} {core_inst/seq_num[20]} {core_inst/seq_num[21]} {core_inst/seq_num[22]} {core_inst/seq_num[23]} {core_inst/seq_num[24]} {core_inst/seq_num[25]} {core_inst/seq_num[26]} {core_inst/seq_num[27]} {core_inst/seq_num[28]} {core_inst/seq_num[29]} {core_inst/seq_num[30]} {core_inst/seq_num[31]} {core_inst/seq_num[32]} {core_inst/seq_num[33]} {core_inst/seq_num[34]} {core_inst/seq_num[35]} {core_inst/seq_num[36]} {core_inst/seq_num[37]} {core_inst/seq_num[38]} {core_inst/seq_num[39]} {core_inst/seq_num[40]} {core_inst/seq_num[41]} {core_inst/seq_num[42]} {core_inst/seq_num[43]} {core_inst/seq_num[44]} {core_inst/seq_num[45]} {core_inst/seq_num[46]} {core_inst/seq_num[47]} {core_inst/seq_num[48]} {core_inst/seq_num[49]} {core_inst/seq_num[50]} {core_inst/seq_num[51]} {core_inst/seq_num[52]} {core_inst/seq_num[53]} {core_inst/seq_num[54]} {core_inst/seq_num[55]} {core_inst/seq_num[56]} {core_inst/seq_num[57]} {core_inst/seq_num[58]} {core_inst/seq_num[59]} {core_inst/seq_num[60]} {core_inst/seq_num[61]} {core_inst/seq_num[62]} {core_inst/seq_num[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {core_inst/message_length[0]} {core_inst/message_length[1]} {core_inst/message_length[2]} {core_inst/message_length[3]} {core_inst/message_length[4]} {core_inst/message_length[5]} {core_inst/message_length[6]} {core_inst/message_length[7]} {core_inst/message_length[8]} {core_inst/message_length[9]} {core_inst/message_length[10]} {core_inst/message_length[11]} {core_inst/message_length[12]} {core_inst/message_length[13]} {core_inst/message_length[14]} {core_inst/message_length[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {core_inst/message_data[0]} {core_inst/message_data[1]} {core_inst/message_data[2]} {core_inst/message_data[3]} {core_inst/message_data[4]} {core_inst/message_data[5]} {core_inst/message_data[6]} {core_inst/message_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {core_inst/message_cnt[0]} {core_inst/message_cnt[1]} {core_inst/message_cnt[2]} {core_inst/message_cnt[3]} {core_inst/message_cnt[4]} {core_inst/message_cnt[5]} {core_inst/message_cnt[6]} {core_inst/message_cnt[7]} {core_inst/message_cnt[8]} {core_inst/message_cnt[9]} {core_inst/message_cnt[10]} {core_inst/message_cnt[11]} {core_inst/message_cnt[12]} {core_inst/message_cnt[13]} {core_inst/message_cnt[14]} {core_inst/message_cnt[15]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_int]
