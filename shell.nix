{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.open-policy-agent
    pkgs.terraform_0_14
    pkgs.trivy
  ];
}
