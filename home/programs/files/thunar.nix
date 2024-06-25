{pkgs, ...}: {
  home.packages = with pkgs.xfce; [
    (thunar.override {
      thunarPlugins = [
        thunar-volman
        thunar-archive-plugin
      ];
    })
  ];

  xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>

    <channel name="thunar" version="1.0">
      <property name="last-view" type="string" value="ThunarIconView"/>
      <property name="last-icon-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_100_PERCENT"/>
      <property name="last-window-maximized" type="bool" value="true"/>
      <property name="last-sort-column" type="string" value="THUNAR_COLUMN_DATE_MODIFIED"/>
      <property name="last-sort-order" type="string" value="GTK_SORT_DESCENDING"/>
      <property name="last-details-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_38_PERCENT"/>
      <property name="last-details-view-column-widths" type="string" value="50,50,128,121,86,342,50,50,573,50,50,302,50,730"/>
      <property name="last-separator-position" type="int" value="170"/>
      <property name="last-details-view-visible-columns" type="string" value="THUNAR_COLUMN_DATE_MODIFIED,THUNAR_COLUMN_NAME,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE"/>
      <property name="misc-single-click" type="bool" value="false"/>
      <property name="hidden-bookmarks" type="array">
        <value type="string" value="computer:///"/>
        <value type="string" value="recent:///"/>
      </property>
    </channel>
  '';
}
