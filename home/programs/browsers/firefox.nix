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
      };
    };
  };
}

