{ config, ... }:

{
    services.hermes-agent = {
        enable = true;
        container = {
            enable = true;
            hostUsers = [ "your-username" ];
            backend = "podman";
        };

        virtualisation.docker.enable = false;

        settings.model.default = "anthropic/claude-sonnet-4";
        environmentFiles = [ "/etc/hermes/api.env" ];
        addToSystemPackages = true;
    };

    security.sudo.extraRules = [{
        users = [ "willsen" ];
        commands = [{
          command = "/run/current-system/sw/bin/podman";
          options = [ "NOPASSWD" ];
        }];
    }];
}

