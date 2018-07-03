# Define rclocal::script
#
# This define creates a single script in /etc/rc.local/.d that is executed by /etc/rc.local at boot time
#
# Usage:
# rclocal::script { "set_route":
#   priority => "10",
#   content  => "route add -net 10.42.0.0/24 gw 10.42.10.1 \n",
# }
#
# Priority influences the execution order while content contains the script
# to be executed. Can be also a template, had has the same syntax of the
# content param in the file type.
#
define rclocal::script (
  Enum['absent', 'present'] $ensure   = 'present',
  String[1]                 $priority = '50',
  Boolean                   $autoexec = true,
  String                    $content  = '',
) {

  include rclocal

  $safe_name = regsubst($name, '/', '_', 'G')

  file { "rclocal_${priority}_${safe_name}":
    ensure  => $ensure,
    path    => "${rclocal::config_dir}/${priority}-${safe_name}",
    mode    => '0755',
    owner   => 'root',
    group   => '0',
    require => File['/etc/rc.local.d'],
    content => $content,
  }

  if $autoexec == true and $ensure == present {
    exec { "rclocal_${priority}_${safe_name}":
      command     => "sh ${rclocal::config_dir}/${priority}-${safe_name}",
      refreshonly => true,
      subscribe   => File[ "rclocal_${priority}_${safe_name}" ],
      path        => '/usr/bin:/bin:/usr/sbin:/sbin',
    }
  }
}

