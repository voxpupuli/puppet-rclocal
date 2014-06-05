# Class: rclocal
#
# Manages /etc/rc.local file inserting a /etc/rc.local.d/ directory where
# each script is managaed by Puppet
#
# Usage:
# include rclocal
#
class rclocal(
  $config_file  = params_lookup( 'config_file' ),
  $config_dir   = params_lookup( 'config_dir' ),
  $template     = params_lookup( 'template' ),
  $scripts      = params_lookup( 'scripts' ),
  ) inherits rclocal::params {

  file { '/etc/rc.local':
    ensure  => present,
    path    => $rclocal::config_file,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => template($rclocal::template),
  }

  file { '/etc/rc.local.d':
    ensure  => directory,
    path    => $rclocal::config_dir,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
  }

  validate_hash($scripts)
  create_resources(rclocal::script,$scripts)
}
