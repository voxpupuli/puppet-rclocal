# Class: rclocal
#
# Manages /etc/rc.local file inserting a /etc/rc.local.d/ directory where
# each script is managaed by Puppet
#
# Usage:
# include rclocal
#
class rclocal {

  # Load the variables used in this module. Check the params.pp file
  require rclocal::params

  file { '/etc/rc.local':
    ensure  => present,
    path    => $rclocal::params::configfile,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => template('rclocal/rc.local.erb'),
  }

  file { '/etc/rc.local.d':
    ensure  => directory,
    path    => $rclocal::params::configdir,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
  }

}
