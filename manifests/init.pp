# Class: rclocal
#
# @summary Manages /etc/rc.local file inserting a /etc/rc.local.d/ directory where
#   each script is managaed by Puppet
#
# @example include rclocal
#
# @param config_file
#   The full name and path of the rc.local file, defaults to /etc/rc.local on most operatingsystems.
#   Must be an absolute path
#
# @param config_dir
#   The directory where rc.local snippets are stored. Must be an absolute path
#
# @param template
#   The template to use to generate the rc.local file. Defaults to module template
#
# @param scripts
#   A hash of snippets to be added.
#   The key must be the snippet name, the values must be parameteres of the rclocal::script define.
#
class rclocal(
  Stdlib::Absolutepath $config_file,
  Stdlib::Absolutepath $config_dir,
  String[1]            $template,
  Hash                 $scripts,
) {

  File {
    owner => 'root',
    group => '0',
    mode  => '0755',
  }

  file { '/etc/rc.local':
    ensure  => file,
    path    => $rclocal::config_file,
    content => epp($rclocal::template),
  }

  file { '/etc/rc.local.d':
    ensure  => directory,
    path    => $rclocal::config_dir,
    purge   => true,
    recurse => true,
  }

  ### Create instances for integration with Hiera
  if $scripts != {} {
    $scripts.each |$k, $v| {
      rclocal::script { $k:
        *       => $v,
        require => File['/etc/rc.local.d'],
      }
    }
  }

  if $facts['service_provider'] == 'systemd' {
    ### Systemd support
    file { '/etc/systemd/system/rc-local.service':
      ensure  => file,
      mode    => '0644',
      content => epp('rclocal/systemd_rc-local.service.epp'),
    }
    service { 'rc-local':
      ensure => running,
      enable => true,
    }
  }

}

