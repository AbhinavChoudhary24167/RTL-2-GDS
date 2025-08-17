module tb_ticket_machine_fsm;
    reg clk;                    // Clock signal
    reg reset;                  // Reset signal
    reg [3:0] start_station;    // Start station input
    reg [3:0] dest_station;     // Destination station input
    reg [6:0] amount;           // Amount inserted
    reg valid_input;            // Valid input signal (asserted when money is inserted)
    reg cancel;                 // Cancel signal

    wire [6:0] return_amt;      // Output for returned change
    wire print_ticket;          // Signal to print the ticket
    wire [6:0] fare;            // Fare for the trip
    wire [6:0] remaining;       // Remaining balance if insufficient amount
    wire [6:0] state;           // Current FSM state (now 7 bits for one-hot encoding)
   
    // Instantiate the FSM module
    ticket_machine_fsm fsm (
        .clk(clk),
        .reset(reset),
        .start_station(start_station),
        .dest_station(dest_station),
        .amount(amount),
        .valid_input(valid_input),
        .cancel(cancel),
        .return_amt(return_amt),
        .print_ticket(print_ticket),
        .fare(fare),
        .remaining(remaining),
        .state(state)
    );
   
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period (5ns high, 5ns low)
    end
   
    // Function to display current state
    function [63:0] get_state_name;
        input [6:0] state;
        begin
            case(state)
                7'b0000001: get_state_name = "RDY";
                7'b0000010: get_state_name = "CALC_FARE";
                7'b0000100: get_state_name = "ACCEPT_PAYMENT";
                7'b0001000: get_state_name = "CHECK_PAYMENT";
                7'b0010000: get_state_name = "PRINT_TICKET";
                7'b0100000: get_state_name = "RETURN_CHANGE";
                7'b1000000: get_state_name = "CANCEL_STATE";
                default: get_state_name = "UNKNOWN";
            endcase
        end
    endfunction
   
    // Stimulus for the testbench
    initial begin
        // Initialize inputs
        reset = 1;
        start_station = 0;
        dest_station = 0;
        amount = 0;
        valid_input = 0;
        cancel = 0;
       
        // Reset the FSM
        #15 reset = 0;  // Provide enough delay for reset to be processed

        // Scenario 1: Multiple payments (Underpayment scenario)
        #20 start_station = 4'd7;
        dest_station = 4'd3;
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd20;
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd15;
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd5;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 2: Cancel during payment
        #20 start_station = 4'd4;
        dest_station = 4'd7;
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd30;
        valid_input = 1;
        #20 valid_input = 0;
        #20 cancel = 1;
        #20 cancel = 0;
        #40;
       
        // Scenario 3: Exact fare
        #20 start_station = 4'd1;  // S1
        dest_station = 4'd5;       // S5
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd40;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 4: Overpayment
        #20 start_station = 4'd5;  // S5
        dest_station = 4'd10;      // S10
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd60;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 5: Underpayment with cancel
        #20 start_station = 4'd2;  // S2
        dest_station = 4'd5;       // S5
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd20;
        valid_input = 1;
        #20 valid_input = 0;
        #20 cancel = 1;
        #20 cancel = 0;
        #40;

        // Scenario 6: Multiple payments with exact fare
        #20 start_station = 4'd1;  // S1
        dest_station = 4'd7;       // S7
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd30;
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd30;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 7: Multiple payments with overpayment
        #20 start_station = 4'd3;  // S3
        dest_station = 4'd8;       // S8
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd40;
        valid_input = 1;
        #20 valid_input = 0;
        #20 amount = 7'd30;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 8: Invalid station input
        #20 start_station = 4'd0;  // Invalid station
        dest_station = 4'd5;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 9: Same start and destination station
        #20 start_station = 4'd5;
        dest_station = 4'd5;
        valid_input = 1;
        #20 valid_input = 0;
        #40;

        // Scenario 10: Cancel immediately after entering stations
        #20 start_station = 4'd2;
        dest_station = 4'd6;
        valid_input = 1;
        #20 valid_input = 0;
        #20 cancel = 1;
        #20 cancel = 0;
        #40;
       
// Scenario 11: Fast sequence of payments without waiting for state change
#20 start_station = 4'd6;  // S6
dest_station = 4'd9;       // S9
amount = 7'd10;
valid_input = 1;
#10 amount = 7'd20;       // Immediately input next amount
#10 amount = 7'd10;       // Rapid multiple payments
valid_input = 0;
#40;

// Scenario 12: Edge case of maximum amount inserted (boundary check)
#20 start_station = 4'd3;  // S3
dest_station = 4'd10;      // S10
amount = 7'd127;           // Maximum possible amount
valid_input = 1;
#20 valid_input = 0;
#40;

// Scenario 13: Check transition with zero amount input
#20 start_station = 4'd4;  // S4
dest_station = 4'd8;       // S8
amount = 7'd0;             // Zero amount case
valid_input = 1;
#20 valid_input = 0;
#40;

// Scenario 14: Multiple quick cancels during payment
#20 start_station = 4'd7;  // S7
dest_station = 4'd2;       // S2
amount = 7'd20;
valid_input = 1;
#20 cancel = 1;            // First cancel attempt
#10 cancel = 0;
#10 cancel = 1;            // Second cancel attempt in quick succession
#20 cancel = 0;
#40;

// Scenario 15: Cancel after maximum amount payment
#20 start_station = 4'd8;  // S8
dest_station = 4'd11;      // S11
amount = 7'd127;           // Maximum possible amount inserted
valid_input = 1;
#20 valid_input = 0;
#10 cancel = 1;            // Cancel immediately after max payment
#20 cancel = 0;
#40;

// Scenario 16: Invalid station followed by valid operation
#20 start_station = 4'd15;  // Invalid station input
dest_station = 4'd10;
valid_input = 1;
#20 valid_input = 0;
#20 start_station = 4'd2;   // Correct the station input
amount = 7'd50;             // Valid amount
valid_input = 1;
#20 valid_input = 0;
#40;

// Scenario 17: Large number of small increments to reach fare
#20 start_station = 4'd4;  // S4
dest_station = 4'd9;       // S9
amount = 7'd5;
valid_input = 1;
repeat (10) begin          // Incrementally add small amounts
    #10 valid_input = 0;
    #10 amount = 7'd5;
    valid_input = 1;
end
#20 valid_input = 0;
#40;

// Scenario 18: Immediate ticket request without inserting amount
#20 start_station = 4'd1;  // S1
dest_station = 4'd6;       // S6
valid_input = 1;
#20 valid_input = 0;
#40;                       // Expect FSM to wait for amount input

// Scenario 19: Multiple stations with the same destination
#20 start_station = 4'd2;  // S2
dest_station = 4'd7;       // S7
amount = 7'd10;
valid_input = 1;
#20 valid_input = 0;
#20 start_station = 4'd3;  // Change to another start station without cancel
amount = 7'd10;
valid_input = 1;
#20 valid_input = 0;
#40;

// Scenario 20: Restart FSM during mid-payment
#20 start_station = 4'd9;  // S9
dest_station = 4'd5;       // S5
amount = 7'd30;
valid_input = 1;
#20 valid_input = 0;
#10 reset = 1;             // Force a reset mid-transaction
#20 reset = 0;
#40;

// Scenario 21: Toggle fare_station_1
#20 start_station = 4'd1;  // Fare corresponds to fare_station_1
dest_station = 4'd2;
amount = 7'd5;
valid_input = 1;
#20 valid_input = 0;  // Check state transition toggling fare_station_1
#40;

// Scenario 22: Toggle fare_station_2
#20 start_station = 4'd2;  // Fare corresponds to fare_station_2
dest_station = 4'd3;
amount = 7'd10;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_2
#40;

// Scenario 23: Toggle fare_station_3
#20 start_station = 4'd3;  // Fare corresponds to fare_station_3
dest_station = 4'd4;
amount = 7'd15;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_3
#40;

// Scenario 24: Toggle fare_station_4
#20 start_station = 4'd4;  // Fare corresponds to fare_station_4
dest_station = 4'd5;
amount = 7'd20;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_4
#40;

// Scenario 25: Toggle fare_station_5
#20 start_station = 4'd5;  // Fare corresponds to fare_station_5
dest_station = 4'd6;
amount = 7'd25;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_5
#40;

// Scenario 26: Toggle fare_station_6
#20 start_station = 4'd6;  // Fare corresponds to fare_station_6
dest_station = 4'd7;
amount = 7'd30;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_6
#40;

// Scenario 27: Toggle fare_station_7
#20 start_station = 4'd7;  // Fare corresponds to fare_station_7
dest_station = 4'd8;
amount = 7'd35;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_7
#40;

// Scenario 28: Toggle fare_station_8
#20 start_station = 4'd8;  // Fare corresponds to fare_station_8
dest_station = 4'd9;
amount = 7'd40;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_8
#40;

// Scenario 29: Toggle fare_station_9
#20 start_station = 4'd9;  // Fare corresponds to fare_station_9
dest_station = 4'd10;
amount = 7'd45;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_9
#40;

// Scenario 30: Toggle fare_station_10
#20 start_station = 4'd10;  // Fare corresponds to fare_station_10
dest_station = 4'd11;
amount = 7'd50;
valid_input = 1;
#20 valid_input = 0;  // Toggle fare_station_10
#40;

        // End the simulation
        #100 $finish;
    end
   
    // Monitor block to display state transitions and important signals
    always @(posedge clk) begin
        $display("Time %0t: State=%s, Start=%0d, Dest=%0d, Amount=%0d, Valid=%0b, Cancel=%0b, Return=%0d, Print=%0b, Fare=%0d, Remaining=%0d",
                 $time, get_state_name(state), start_station, dest_station, amount, valid_input, cancel,
                 return_amt, print_ticket, fare, remaining);
    end

    // Generate VCD file for waveform analysis
    initial begin
        $dumpfile("ticket_machine_fsm.vcd");  // Specify the output file
        $dumpvars(0, tb_ticket_machine_fsm);  // Dump all variables for this module
    end

endmodule

