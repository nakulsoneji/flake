{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

  xdg.configFile."vesktop/settings/quickCss.css".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css");
  '';

  xdg.configFile."vesktop/settings/settings.json".text = ''
    {
      "autoUpdate": false,
      "autoUpdateNotification": false,
      "useQuickCss": true,
      "themeLinks": [],
      "enabledThemes": [],
      "enableReactDevtools": false,
      "frameless": false,
      "transparent": false,
      "winCtrlQ": false,
      "disableMinSize": false,
      "winNativeTitleBar": false,
      "plugins": {
        "ChatInputButtonAPI": {
          "enabled": false
        },
        "CommandsAPI": {
          "enabled": true
        },
        "MemberListDecoratorsAPI": {
          "enabled": false
        },
        "MessageAccessoriesAPI": {
          "enabled": true
        },
        "MessageDecorationsAPI": {
          "enabled": false
        },
        "MessageEventsAPI": {
          "enabled": false
        },
        "MessagePopoverAPI": {
          "enabled": false
        },
        "MessageUpdaterAPI": {
          "enabled": false
        },
        "ServerListAPI": {
          "enabled": false
        },
        "UserSettingsAPI": {
          "enabled": true
        }
      },
      "notifications": {
        "timeout": 5000,
        "position": "bottom-right",
        "useNative": "not-focused",
        "logLimit": 50
      },
      "cloud": {
        "authenticated": false,
        "url": "https://api.vencord.dev/",
        "settingsSync": false,
        "settingsSyncVersion": 1719899009882
      }
    }
  '';
}
