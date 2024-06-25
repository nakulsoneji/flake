{
  programs.firefox = {
    enable = true;
    profiles = {
      nakul = {
        isDefault = true;
        search = {
          default = "Google";
          engines = {
            "Google" = {};
          };
          force = true;
        };
        settings = {
          # turn off password saving because we are using bitwarden
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "signon.rememberSignons" = false;
          # restore pages on startup automatically
          "browser.startup.page" = 3;
          # enable userChrome.css
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };
}
