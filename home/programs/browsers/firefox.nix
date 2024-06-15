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
        };
      };
    };
  };
}
