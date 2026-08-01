{ hostname, ... }:

{
  networking.hostName = hostname;

  time.timeZone = "Atlantic/Canary";

  i18n.defaultLocale = "en_US.UTF-8";
}
