{ config, ... }:

{
    services.hermes-agent = {
        enable = true;
        settings.model.default = "anthropic/claude-sonnet-4";
        environmentFiles = [ "/etc/hermes/api.env" ];
        addToSystemPackages = true;
    };
}

