/*
 
Copyright (c) 2019 Alex Forencich
 
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 
*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * 10M/100M Ethernet MAC with RMII interface
 */
module eth_mac_rmii #
  (
    // target ("SIM", "GENERIC", "XILINX", "ALTERA")
    parameter TARGET = "GENERIC",
    // Clock input style ("BUFG", "BUFR", "BUFIO", "BUFIO2")
    // Use BUFR for Virtex-5, Virtex-6, 7-series
    // Use BUFG for Ultrascale
    // Use BUFIO2 for Spartan-6
    parameter CLOCK_INPUT_STYLE = "BUFIO2",
    parameter ENABLE_PADDING = 1,
    parameter MIN_FRAME_LENGTH = 64
  )
  (
    input  wire        rst,
    output wire        rx_clk,
    output wire        rx_rst,
    output wire        tx_clk,
    output wire        tx_rst,

    /*
     * AXI input
     */
    input  wire [7:0]  tx_axis_tdata,
    input  wire        tx_axis_tvalid,
    output wire        tx_axis_tready,
    input  wire        tx_axis_tlast,
    input  wire        tx_axis_tuser,

    /*
     * AXI output
     */
    output wire [7:0]  rx_axis_tdata,
    output wire        rx_axis_tvalid,
    output wire        rx_axis_tlast,
    output wire        rx_axis_tuser,

    /*
     * RMII interface
     */
    input  wire       phy_rmii_ref_clk,  // 50MHz required
    input  wire       phy_rmii_crsdv,
    input  wire       phy_rmii_rxer,     // rxer is optional for RMII
    input  wire [1:0] phy_rmii_rxd,
    output wire       phy_rmii_txen,
    output wire [1:0] phy_rmii_txd,

    /*
     * Status
     */
    output wire        tx_start_packet,
    output wire        tx_error_underflow,
    output wire        rx_start_packet,
    output wire        rx_error_bad_frame,
    output wire        rx_error_bad_fcs,

    /*
     * Configuration
     */
    input  wire [7:0]  ifg_delay
  );

  wire [3:0]  mac_mii_rxd;
  wire        mac_mii_rx_dv;
  wire        mac_mii_rx_er;
  wire [3:0]  mac_mii_txd;
  wire        mac_mii_tx_en;
  wire        mac_mii_tx_er;


  rmii_phy_if
    rmii_phy_if_dut (
      .rstn (!rst ),
      //100M
      .mode_speed (1'b1 ),
      //.mac_mii_crs (mii_crs ),
      .mac_mii_rxrst (rx_rst ),
      .mac_mii_rxc (rx_clk ),
      .mac_mii_rxdv (mac_mii_rx_dv ),
      .mac_mii_rxer (mac_mii_rx_er ),
      .mac_mii_rxd (mac_mii_rxd ),
      .mac_mii_txrst (tx_rst ),
      .mac_mii_txc (tx_clk ),
      .mac_mii_txen (mac_mii_tx_en ),
      .mac_mii_txer (mac_mii_tx_er ),
      .mac_mii_txd (mac_mii_txd ),

      .phy_rmii_ref_clk (phy_rmii_ref_clk ),
      .phy_rmii_crsdv (phy_rmii_crsdv ),
      .phy_rmii_rxer (phy_rmii_rxer ),
      .phy_rmii_rxd (phy_rmii_rxd ),
      .phy_rmii_txen (phy_rmii_txen ),
      .phy_rmii_txd  ( phy_rmii_txd)
    );


  eth_mac_1g #(
               .ENABLE_PADDING(ENABLE_PADDING),
               .MIN_FRAME_LENGTH(MIN_FRAME_LENGTH)
             )
             eth_mac_1g_inst (
               .tx_clk(tx_clk),
               .tx_rst(tx_rst),
               .rx_clk(rx_clk),
               .rx_rst(rx_rst),
               .tx_axis_tdata(tx_axis_tdata),
               .tx_axis_tvalid(tx_axis_tvalid),
               .tx_axis_tready(tx_axis_tready),
               .tx_axis_tlast(tx_axis_tlast),
               .tx_axis_tuser(tx_axis_tuser),
               .rx_axis_tdata(rx_axis_tdata),
               .rx_axis_tvalid(rx_axis_tvalid),
               .rx_axis_tlast(rx_axis_tlast),
               .rx_axis_tuser(rx_axis_tuser),
               .gmii_rxd(mac_mii_rxd),
               .gmii_rx_dv(mac_mii_rx_dv),
               .gmii_rx_er(mac_mii_rx_er),
               .gmii_txd(mac_mii_txd),
               .gmii_tx_en(mac_mii_tx_en),
               .gmii_tx_er(mac_mii_tx_er),
               .rx_clk_enable(1'b1),
               .tx_clk_enable(1'b1),
               .rx_mii_select(1'b1),
               .tx_mii_select(1'b1),
               .tx_start_packet(tx_start_packet),
               .tx_error_underflow(tx_error_underflow),
               .rx_start_packet(rx_start_packet),
               .rx_error_bad_frame(rx_error_bad_frame),
               .rx_error_bad_fcs(rx_error_bad_fcs),
               .ifg_delay(ifg_delay)
             );

endmodule

`resetall
