# Class: puppetlabs
#
# This class installs and configures the Puppet Labs base classes
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class puppetlabs {
  #
  # This is our base install for all of our servers. 
  #  

  class { "nagios::params":
    nrpe_server       => '74.207.240.137',
    nagios_site_alias => 'nagios.puppetlabs.com',
  }
  include nagios
  include munin
  include ntp
  include puppet
  include ssh::server
  include virtual::users 
  include virtual::packages
  include virtual::nagioscontacts
  include sudo
  include packages

  ssh::allowgroup { "sysadmin": }
  sudo::allowgroup { "sysadmin": }

  Account::User <| tag == 'allstaff' |>
  Group <| tag == 'allstaff' |>

  if defined(Class["firewall"]) { Firewall <||> }

}
