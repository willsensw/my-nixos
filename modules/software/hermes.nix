{ config, pkgs, ... }:

{
    virtualisation.podman = {
        enable = true;
        dockerCompat = true; # Provides a docker alias if needed
        defaultNetwork.settings.dns_enabled = true;
    };

    services.hermes-agent = {
        enable = true;
        container = {
            enable = true;
            hostUsers = [ "beimao" ];
            backend = "podman";
        };

        virtualisation.docker.enable = false;

        settings.model.default = "anthropic/claude-sonnet-4";
        environmentFiles = [ "/etc/hermes/api.env" ];
        addToSystemPackages = true;
    };

    security.sudo.extraRules = [{
        users = [ "beimao" ];
        commands = [{
          command = "/run/current-system/sw/bin/podman";
          options = [ "NOPASSWD" ];
        }];
    }];
}

