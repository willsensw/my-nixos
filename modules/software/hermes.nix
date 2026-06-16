{ config, ... }:

{
    services.hermes-agent = {
        enable = true;
        container = {
            enable = true;
            hostUsers = [ "your-username" ];
        };
        settings.model.default = "anthropic/claude-sonnet-4";
        environmentFiles = [ "/etc/hermes/api.env" ];
        addToSystemPackages = true;
    };
}

