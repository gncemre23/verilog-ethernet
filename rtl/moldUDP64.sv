

// Create Date: 12/19/2021 09:35:31 AM
// Module Name: MoldUDP64Decode
// Developer  : Emre Goncu (egoncu@itu.edu.tr)
// Description:
// Decode the coming data as Session, Sequence Number, Message count, Message length and Message data
//
// Revision:
// Revision 0.01 12/19/21    - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`resetall
`timescale 1ns / 1ps
`default_nettype none

module moldUPD64_decoder
  (
    input wire rst,
    input wire clk,
    input wire [7:0] UDP_Payload_data,
    input wire UDP_Payload_valid,

    output wire [79:0] session,
    output wire [63:0] seq_num,
    output wire [15:0] message_cnt,
    output wire [15:0] message_length,
    output wire [7:0] message_data
  );


  localparam SESSION_LEN = 8;
  localparam SEQ_NUM_LEN = 6;


  typedef enum  {
            READ_SESSION,
            READ_SEQ_NUM,
            READ_MESSAGE_CNT,
            READ_MESSAGE_LEN,
            READ_MESSAGE_DATA
          } state_moldUDP64;

  state_moldUDP64 state_next, state_reg;

  logic signed [15:0] counter_next, counter_reg;
  logic [79:0] session_next, session_reg;
  logic [63:0] seq_num_next, seq_num_reg;
  logic [15:0] msg_cnt_next, msg_cnt_reg;
  logic [15:0] msg_len_next, msg_len_reg;
  logic [7:0] data_next, data_reg;
  logic first_byte_next, first_byte_reg;


  assign session = session_reg;
  assign seq_num = seq_num_reg;
  assign message_cnt = msg_cnt_reg;
  assign message_length = msg_len_reg;
  assign message_data = data_reg;



  // Finite State Machine

  //sequential part
  always_ff @( posedge clk )
  begin : seq_part
    if(rst)
    begin
      state_reg <= READ_SESSION;
      counter_reg <= SESSION_LEN;
      session_reg <= 80'd0;
      seq_num_reg <= 64'd0;
      msg_cnt_reg <= 16'd0;
      msg_len_reg <= 16'd0;
      data_reg <= 8'd0;
      first_byte_reg <= 1'b0;
    end
    else
    begin
      state_reg <= state_next;
      counter_reg <= counter_next;
      session_reg <= session_next;
      seq_num_reg <= seq_num_next;
      msg_cnt_reg <= msg_cnt_next;
      msg_len_reg <= msg_len_next;
      data_reg <= data_next;
      first_byte_reg <= first_byte_next;
    end
  end


  always_comb
  begin : comb_part
    //default assignments
    state_next = state_reg;
    counter_next = counter_reg;
    session_next = session_reg;
    seq_num_next = seq_num_reg;
    msg_cnt_next = msg_cnt_reg;
    msg_len_next = msg_len_reg;
    data_next = data_reg;
    first_byte_next = first_byte_reg;
    case (state_reg)
      READ_SESSION:
      begin
        if(UDP_Payload_valid)
        begin
          session_next = {session_reg[71:0], UDP_Payload_data};
          if(counter_reg < 0)
          begin
            state_next = READ_SEQ_NUM;
            counter_next = SEQ_NUM_LEN;
          end
          else
          begin
            counter_next = counter_reg - 1;
          end
        end
      end
      READ_SEQ_NUM:
      begin
        if(UDP_Payload_valid)
        begin
          seq_num_next = {seq_num_reg[55:0], UDP_Payload_data};
          if(counter_reg < 0)
          begin
            state_next = READ_MESSAGE_CNT;
            first_byte_next = 1'b1;
          end
          else
          begin
            counter_next = counter_reg - 1;
          end
        end
      end
      READ_MESSAGE_CNT:
      begin
        if(UDP_Payload_valid)
        begin
          msg_cnt_next = {msg_cnt_reg[7:0], UDP_Payload_data};
          if(first_byte_reg)
          begin
            first_byte_next = 1'b0;
          end
          // second byte is read
          else
          begin
            //heart beat (msg_count == 16'h0000) or end of session (msg_count == 16'hFFFF) 
            if({msg_cnt_reg[7:0], UDP_Payload_data} == 16'd0 || {msg_cnt_reg[7:0], UDP_Payload_data} == 16'hFFFF )
            begin
              state_next = READ_SESSION;
              counter_next = SESSION_LEN;
            end
            else
            begin
              first_byte_next = 1'b1;
              state_next = READ_MESSAGE_LEN;
            end         
          end
        end
      end

      READ_MESSAGE_LEN:
      begin
        if(UDP_Payload_valid)
        begin
          msg_len_next = {msg_len_reg[7:0], UDP_Payload_data};
          if(first_byte_reg)
          begin
            first_byte_next = 1'b0;
          end
          // second byte is read
          else
          begin
            first_byte_next = 1'b1;
            state_next = READ_MESSAGE_DATA;
            counter_next = {msg_len_reg[7:0], UDP_Payload_data} - 2;
          end
        end
      end
      READ_MESSAGE_DATA:
      begin
        if(UDP_Payload_valid)
        begin
          data_next = UDP_Payload_data;
          if(counter_reg < 0)
          begin
            if(msg_cnt_reg > 1)
            begin
              state_next = READ_MESSAGE_LEN;
              first_byte_next = 1'b1;
              msg_cnt_next = msg_cnt_reg - 1;
            end
            else
            begin
              state_next = READ_SESSION;
              counter_next = SESSION_LEN;
            end
          end
          else
          begin
            counter_next = counter_reg - 1;
          end
        end
      end

    endcase

  end


endmodule

`resetall
