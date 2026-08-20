{ config, pkgs, lib, ... }:

{
	environment.systemPackages = with pkgs; [
		python314
		(python3.withPackages(ps: with ps; [
    		numpy       # Math for signal processing
    		matplotlib  # Plotting graphs for reports
  		]))
	];
}
