# Class: rclocal
#
# Manages /etc/rc.local file inserting a /etc/rc.local.d/ directory where
# each script is managaed by Puppet
#
# Usage:
# include rclocal
#
class rclocal(
  $config_file  = $::rclocal::params::config_file,
  $config_dir   = $::rclocal::params::config_dir,
  $template     = $::rclocal::params::template,
  $scripts      = $::rclocal::params::scripts
  ) inherits rclocal::params {

  file { '/etc/rc.local':
    ensure  => present,
    path    => $rclocal::config_file,
    mode    => '0755',
    owner   => 'root',
    group   => '0',
    content => template($rclocal::template),
  }

  file { '/etc/rc.local.d':
    ensure  => directory,
    path    => $rclocal::config_dir,
    mode    => '0755',
    owner   => 'root',
    group   => '0',
    purge   => true,
    recurse => true,
  }

  ### Create instances for integration with Hiera
  if $scripts != {} {
    validate_hash($scripts)
    create_resources(rclocal::script, $scripts)
  }
}
