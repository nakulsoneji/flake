{
  imports = [
    ./thunderbird.nix
  ];

  accounts.email.accounts = {
    "personal" = {
      primary = true;
      address = "nakulsoneji@gmail.com";
      userName = "nakulsoneji@gmail.com";
      realName = "Nakul Soneji";
      flavor = "gmail.com";
      # passwordCommand = "echo 'segs buzo gedl tfvt'";
      # aerc = {
      #   enable = true;
      # };
      # neomutt = {
      #   enable = true;
      #   mailboxType = "imap";
      # };
    };
  };
}
