let
  mammon = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIObzQK5vg61WvNubo514N71Ep56MndDC/b7E6JNqm0WB";
  # fission = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJVqMsagmi1QcqFdbXW2YmZzPjSddYZPtyrwIN7+zhjZaiHoaCyARMwt5d/HoFNotzqxAJATxcicSTHdaH5kWqs=";
  clients = [mammon]; # fission];

  ixion = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEli8vPjeSMQdg0Z/8SXsW22dR8np+TxfM3wCTmHtW9s";
  heracles = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEtnpNKREbh8BKbwm9cMQhAD93Rb4LlzDEh64enElkZh";
  athena = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRwLRgWd29elyY7D5axaZCpXMuo1yzNPsku2f4SB31N";
  thoth = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINvFk9tHSoQEOCE1FYnOb8XvJZngT9cQjqDmSACIlSTn";
  anubis = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtMDaXfqZeNEVkTFLcn80Yvhtq0UU7+t7qTTZwJ2RrI";
  osiris = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJTf+nMqirqkEvQnkFXup+GIhRCde1NpAEwdkOVCGhLA";
  seth = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPEWMH5fXKJYSjxISe+VqlL+dCuykZ9NDieWkw1vNwdN";
  servers = [ixion heracles athena thoth anubis osiris seth];
in
{
  "k3s-token.age".publicKeys = clients ++ servers;
  "admin-password-hash.age".publicKeys = clients ++ servers;
}
