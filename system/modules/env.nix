{
  environment.sessionVariables = rec {
    TERMINAL = "ghostty";
    EDITOR = "nvim";

    # Workaround for installing global NPM packages
    NPM_CONFIG_PREFIX = "$HOME/.local/share/npm";
    NPM_CONFIG_CACHE = "$HOME/.cache/npm";
    PATH = "${NPM_CONFIG_PREFIX}/bin:$PATH";
  };
}
