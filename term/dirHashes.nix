{config, ...}: let
  HOME = config.home.homeDirectory;
in {
  doc = "${HOME}/Documents";
  vid = "${HOME}/Videos";
  dl = "${HOME}/Downloads";

  cfg = "${HOME}/.config";
  hm = "${HOME}/.config/home-manager";
  nvim = "${HOME}/.config/nvim";

  p = "${HOME}/projects";
  py = "${HOME}/projects/learning_python";
  rs = "${HOME}/projects/rust";
  r = "${HOME}/projects/ROBOTICS";
}
