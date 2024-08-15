let
  mammon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIObzQK5vg61WvNubo514N71Ep56MndDC/b7E6JNqm0WB";
  clients = [mammon];

  ixion = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEli8vPjeSMQdg0Z/8SXsW22dR8np+TxfM3wCTmHtW9s";
  heracles = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEtnpNKREbh8BKbwm9cMQhAD93Rb4LlzDEh64enElkZh";
  athena = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRwLRgWd29elyY7D5axaZCpXMuo1yzNPsku2f4SB31N";
  thoth = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8btAZ6zNGff/x9TvtS668dAdafz4mtiSFleY7aNIke";
  anubis = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtMDaXfqZeNEVkTFLcn80Yvhtq0UU7+t7qTTZwJ2RrI";
  servers = [ixion heracles athena thoth anubis];
in
{
  "k3s-token.age".publicKeys = clients ++ servers;
  "admin-password-hash.age".publicKeys = clients ++ servers;
}
