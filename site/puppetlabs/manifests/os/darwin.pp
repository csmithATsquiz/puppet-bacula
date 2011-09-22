class puppetlabs::os::darwin {

  # let local admins login over ssh and sudo
  ssh::allowgroup  { "admin": }
  sudo::allowgroup { "admin": }

  # keep macports up to date
  cron {
    "update macports":
      command => "/opt/local/bin/port -q selfupdate",
      minute  => 0,
      hour    => 0,
      weekday => 1,
  }

}
