# vim: sw=2
{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        modules-left = ["custom/launcher" "hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["network" "battery" "clock"];
        "custom/launcher" = {
          format = "󱄅 ";
          tooltip = false;
          on-click = "wofi --show drun";
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-full = "{icon} {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹"];
          tooltip = false;
          battery = {
            interval = 1;
            states = {
              good = 100;
              warning = 50;
              critical = 20;
            };
          };
        };
        "network" = {
          interval = 2;
          format-wifi = "  {essid}";
          format-disconnected = "  Disconnected";
          family = "ipv4";
          on-click = "kitty -e -- nmcli dev wifi list";
        };
        "clock" = {
          format = "  {:%I:%M, %b %d}";
          today-format = "<b>{}</b>";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = " ";
            "2" = " ";
            "3" = " ";
            "4" = " ";
            "5" = " ";
          };
          persistent-workspaces = true;
        };
      };
    };

    style = ./waybar.css;
  };
}
