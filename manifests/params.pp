# Class: rclocal::params
#
# Sets internal variables and defaults for rclocal module
# This class is automatically loaded in all the classes that use the values set here
#
class rclocal::params  {

## MODULE INTERNAL VARIABLES
# (Modify to adapt to unsupported OSes)

  $config_file = $::osfamily ? {
    RedHat  => '/etc/rc.d/rc.local',
    default => '/etc/rc.local',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/rc.local.d',
  }

  # General settings
  $template = 'rclocal/rc.local.erb'

  # Start with an empty script hash
  $scripts = { }

}
