# vim: sw=2
{
  pkgs,
  lib,
  ...
}: let
  nur =
    import
    (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
      sha256 = "1aisirih9p9jpr3pzs5qdyddi49w0x6j5z7nk3xar3sn4qck4gim";
    })
    {inherit pkgs;};

  verticalTabs = true;
in {
  # Custom Firefox Theme
  home.file.".mozilla/firefox/collin/chrome" = {
    source = ./files;
    recursive = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };

    profiles.collin = {
      isDefault = true;

      extensions = with nur.repos.rycee.firefox-addons; [
        ublock-origin
        sponsorblock
        darkreader
        df-youtube
        bitwarden
        side-view
        (lib.mkIf verticalTabs tabcenter-reborn)
      ];
      settings = {
        # All UserChromes have you enable these
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "layout.css.color-mix.enabled" = true;

        # Smooth scrolling is nice
        "general.smoothScroll" = true;

        # Custom firefox theme
        "firefoxone.tree_tabs_style" = lib.mkIf verticalTabs true;
      };
      bookmarks = [
        {
          name = "ChatGPT";
          url = "https://chat.openai.com";
        }
        {
          name = "Classroom";
          url = "https://classroom.google.com";
        }
        {
          name = "Home Manager Options";
          url = "https://nix-community.github.io/home-manager/options.html";
        }
      ];
    };
  };
}
