module ticket_machine_fsm(
    input clk,                  // Clock signal
    input reset,                // Reset signal
    input [3:0] start_station,  // Start station (4 bits for stations S1-S10)
    input [3:0] dest_station,   // Destination station
    input [6:0] amount,         // Amount inserted
    input valid_input,          // Signal when the amount is inserted
    input cancel,               // Cancel signal

    output reg [6:0] return_amt, // Return amount
    output reg print_ticket,    // Signal to print the ticket
    output reg [6:0] fare,      // Fare for the selected route
    output reg [6:0] remaining, // Remaining balance if amount is insufficient
    output reg [6:0] state      // Current FSM state (one-hot encoded)
);

    // One-hot state encoding
    parameter [6:0] RDY            = 7'b0000001;
    parameter [6:0] CALC_FARE      = 7'b0000010;
    parameter [6:0] ACCEPT_PAYMENT = 7'b0000100;
    parameter [6:0] CHECK_PAYMENT  = 7'b0001000;
    parameter [6:0] PRINT_TICKET   = 7'b0010000;
    parameter [6:0] RETURN_CHANGE  = 7'b0100000;
    parameter [6:0] CANCEL_STATE   = 7'b1000000;

    // Individual registers for station fares
    reg [6:0] fare_station_1, fare_station_2, fare_station_3, fare_station_4, fare_station_5;
    reg [6:0] fare_station_6, fare_station_7, fare_station_8, fare_station_9, fare_station_10;

    // Register to hold the total amount inserted
    reg [6:0] total_amount;

    // Initialization block (for simulation purposes)
    initial begin
        fare_station_1 = 7'd10;
        fare_station_2 = 7'd20;
        fare_station_3 = 7'd30;
        fare_station_4 = 7'd40;
        fare_station_5 = 7'd50;
        fare_station_6 = 7'd60;
        fare_station_7 = 7'd70;
        fare_station_8 = 7'd80;
        fare_station_9 = 7'd90;
        fare_station_10 = 7'd100;
    end

    // Function to get fare for a given station
    function [6:0] get_station_fare;
        input [3:0] station;
        begin
            case(station)
                4'd1: get_station_fare = fare_station_1;
                4'd2: get_station_fare = fare_station_2;
                4'd3: get_station_fare = fare_station_3;
                4'd4: get_station_fare = fare_station_4;
                4'd5: get_station_fare = fare_station_5;
                4'd6: get_station_fare = fare_station_6;
                4'd7: get_station_fare = fare_station_7;
                4'd8: get_station_fare = fare_station_8;
                4'd9: get_station_fare = fare_station_9;
                4'd10: get_station_fare = fare_station_10;
                default: get_station_fare = 7'd0;
            endcase
        end
    endfunction

    // FSM
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset state and outputs
            state <= RDY;
            print_ticket <= 0;
            return_amt <= 7'd0;
            fare <= 7'd0;
            remaining <= 7'd0;
            total_amount <= 7'd0;
        end else begin
            case (state)
                // RDY: Initial state, waiting for station inputs
                RDY: begin
                    print_ticket <= 0;
                    return_amt <= 7'd0;
                    remaining <= 7'd0;
                    total_amount <= 7'd0;

                    if (cancel) begin
                        state <= CANCEL_STATE;
                    end else if (valid_input && start_station > 0 && start_station <= 10 && dest_station > 0 && dest_station <= 10) begin
                        state <= CALC_FARE;
                    end
                end

                // CALC_FARE: Calculate the fare between start_station and dest_station
                CALC_FARE: begin
                    if (start_station != dest_station) begin
                        fare <= (start_station > dest_station) ?
                                (get_station_fare(start_station) - get_station_fare(dest_station)) :
                                (get_station_fare(dest_station) - get_station_fare(start_station));
                        total_amount <= 7'd0; // Reset total_amount
                        state <= ACCEPT_PAYMENT;
                    end else begin
                        state <= RDY; // If start and destination stations are the same, reset to RDY
                    end
                end

                // ACCEPT_PAYMENT: Accept payment from the user
                ACCEPT_PAYMENT: begin
                    if (cancel) begin
                        state <= CANCEL_STATE;
                    end else if (valid_input && amount > 0) begin
                        total_amount <= total_amount + amount;
                        state <= CHECK_PAYMENT;
                    end
                end

                // CHECK_PAYMENT: Check if the total amount inserted covers the fare
                CHECK_PAYMENT: begin
                    if (total_amount >= fare) begin
                        return_amt <= total_amount - fare;
                        state <= PRINT_TICKET;
                    end else begin
                        remaining <= fare - total_amount;
                        state <= ACCEPT_PAYMENT; // Stay in ACCEPT_PAYMENT to accept more money
                    end
                end

                // PRINT_TICKET: Signal to print the ticket and handle return amount if applicable
                PRINT_TICKET: begin
                    print_ticket <= 1; // Signal to print the ticket
                    if (return_amt > 0) begin
                        state <= RETURN_CHANGE; // If there's a return amount, move to RETURN_CHANGE state
                    end else begin
                        state <= RDY; // No return amount, go back to RDY state
                    end
                end

                // RETURN_CHANGE: Return any excess money to the user
                RETURN_CHANGE: begin
                    // Return the change and then reset to RDY state
                    return_amt <= 7'd0; // Reset return amount after change is given
                    state <= RDY;
                end

                // CANCEL_STATE: Handle cancellation and refund the inserted amount
                CANCEL_STATE: begin
                    return_amt <= total_amount; // Refund the total amount inserted
                    print_ticket <= 0; // Ensure no ticket is printed on cancellation
                    state <= RDY;  // Go back to ready state
                end

                default: state <= RDY; // Default state to handle unexpected situations
            endcase
        end
    end
endmodule
