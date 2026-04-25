{ config, pkgs, lib, ... }:

{
	environment.systemPackages = with pkgs; [
		python314
		(python3.withPackages(ps: with ps; [
    			numpy       # Math for signal processing
    			matplotlib  # Plotting graphs for reports
    			pyserial    # UART communication with the FPGA
    			spidev      # SPI communication (if simulating on Pi)
    			fastapi     # For building the IoT Web Server later
    			uvicorn     # Server runner
  		]))
	];
}
