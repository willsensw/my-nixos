{ config, pkgs, lib, ... }:

{
	environment.systemPackages = with pkgs; [
  		# The essential toolchain
  		gcc-arm-embedded  # The compiler for STM32
  		stlink            # For flashing via ST-Link
  		stm32flash        # Specifically for UART/FT232RL flashing
  		openocd           # The "Universal" debugger/flasher
	];

	# Crucial: This fixes the "Permission Denied" for your FT232RL and STM32
	services.udev.packages = with pkgs; [ 
		stlink 
		openocd 
	];

	# How to flash FT232RL
	# stm32flash -w your_firmware.bin -v -g 0x0 /dev/ttyUSB0
}
