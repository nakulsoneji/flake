{
  programs.thunderbird = {
    enable = true;
    profiles.main = {
      isDefault = true;
      settings = {
        "mailnews.default_sort_order" = 2;
      };
    };
  };
}
