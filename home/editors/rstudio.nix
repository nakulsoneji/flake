{pkgs, ...}: {
  home.packages = with pkgs; [
    (rstudioWrapper.override {
      packages = with pkgs.rPackages; [
        ggplot2
        dplyr
        xts
        rmarkdown
      ];
    })
  ];
}
