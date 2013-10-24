# Class: rclocal::params
#
# Sets internal variables and defaults for rclocal module
# This class is automatically loaded in all the classes that use the values set here
#
class rclocal::params  {

## MODULE INTERNAL VARIABLES
# (Modify to adapt to unsupported OSes)

  $configfile = $::osfamily ? {
    RedHat  => '/etc/rc.d/rc.local',
    default => '/etc/rc.local',
  }

  $configdir = $::operatingsystem ? {
    default => '/etc/rc.local.d',
  }

  # General settings
  $templatepath = 'rclocal'
  $templatefile = 'rc.local.erb'
}
