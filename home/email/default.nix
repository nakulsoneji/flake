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
      passwordCommand = "bw get item 'Google Main' | jq -r '.fields[0].value'";
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
