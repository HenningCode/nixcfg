{
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.henning = {
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        sponsorblock
        darkreader
      ];

      search.force = true;

      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "browser.startup.page" = 3;
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
        "widget.gtk.overlay-scrollbars.enabled" = false;
        "general.autoScroll" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
      };
    };
  };
}
