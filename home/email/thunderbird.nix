{
  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "mailnews.default_sort_order" = 2;
        "mail.biff.show_alert" = false;
        "mail.biff.play_sound" = false;
        "mailnew.message_display.disable_remote_image" = true;
        "calendar.alarms.playsound" = false;
        "calendar.alarms.show" = false;
        "calendar.alarms.showmissed" = false;
      };
    };
  };
}
