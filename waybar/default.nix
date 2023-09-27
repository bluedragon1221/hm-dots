# vim: sw=2

{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	layer = "top";
	height = 30;
	modules-left = [
	  "custom/launcher"
	];
	modules-right = [
	  "network"
	    "battery"
	    "clock"
	];
	"custom/launcher" = {
	  format = " ";
	  on-click = "nixGL kitty";
	};

	"battery" = {
	  format =  "{icon} {capacity}%";
	  format-charging =  "󰂄 {capacity}%";
	  format-full =  "{icon} {capacity}%";
	  format-icons =  ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹"];
	  tooltip =  false;
	  battery =  {
	    interval = 1;
	    states = {
	      good = 100;
	      warning = 50;
	      critical = 20;
	    };
	  };
	};
	"network" = {
	  interval =  2;
	  format-wifi =  "  {essid}";
	  format-disconnected =  "  Disconnected";
	  family =  "ipv4";
	  on-click =  "kitty -e -- nmcli dev wifi list";
	};
	"clock" = {
	    format = "  {:%I:%M, %b %d}";
	    today-format = "<b>{}</b>";
	};
      };
    };

    style = ./style.css;
  };
}
