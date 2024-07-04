{
  imports = [
    ./thunderbird.nix
    ./aerc.nix
    ./neomutt.nix
  ];

  accounts.email.accounts = {
    "personal" = {
      primary = true;
      address = "nakulsoneji@gmail.com";
      userName = "nakulsoneji@gmail.com";
      realName = "Nakul Soneji";
      flavor = "gmail.com";
      passwordCommand = "rbw get 'Google Main' -f 'App Password'";
      aerc = {
        enable = true;
      };
      neomutt = {
        enable = true;
        mailboxType = "imap";
      };
    };
  };
}
