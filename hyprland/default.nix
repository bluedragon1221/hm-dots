# vim: sw=2
{pkgs, ...}: {
  home.packages = with pkgs; [hyprland wbg];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    settings = {
      "$mod" = "SUPER";

      monitor = ",prefered,auto,1";

      exec-once = [
        "${pkgs.waybar}/bin/waybar &"
        "${pkgs.wbg}/bin/wbg ${./wallpaper.jpg}"
      ];

      bind = [
        "$mod, X, exec, ${pkgs.kitty}/bin/kitty"
        "$mod, B, exec, firefox"
        "$mod, Q, killactive,"
        "$mod SHIFT, Q, exit"
        "$mod, space, exec, ${pkgs.wofi}/bin/wofi"
        "$mod, L, exec, systemctl suspend"
        "$mod SHIFT, C, exec, systemctl hibernate"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 8;
      };

      gestures.workspace_swipe = true;

      decoration = {
        rounding = 4;
        drop_shadow = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
      };

      animations = {
        enabled = true;
        animation = [
          "border, 0, 2, default"
          "fade, 0, 4, default"
          "windows, 1, 2, default, slide"
          "workspaces, 1, 3, default, slide"
        ];
      };
    };

    extraConfig = ''
      ${builtins.concatStringsSep "\n" (builtins.genList (x: let
          ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
        in "  bind = $mod, ${ws}, workspace, ${
          toString (x + 1)
        }\n  bind = $mod SHIFT, ${ws}, movetoworkspace, ${
          toString (x + 1)
        }\n") 10)}
    '';
  };
}
