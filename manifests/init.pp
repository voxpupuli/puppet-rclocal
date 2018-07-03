# Class: rclocal
#
# Manages /etc/rc.local file inserting a /etc/rc.local.d/ directory where
# each script is managaed by Puppet
#
# Usage:
# include rclocal
#
class rclocal(
  Stdlib::Absolutepath $config_file,
  Stdlib::Absolutepath $config_dir,
  String[1]            $template,
  Hash                 $scripts,
) {

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
    $scripts.each |$k, $v| {
      rclocal::scripts { $k:
        * => $v,
      }
    }
  }

}

