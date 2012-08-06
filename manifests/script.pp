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
# to be executed. Can be also a template, had has the saem syntax of the
# content param in the file type.
#
define rclocal::script (
  $priority = '50',
  $autoexec = true,
  $content  = '' ) {

  include rclocal
  require rclocal::params

  $safe_name = regsubst($name, '/', '_', 'G')
  $bool_autoexec = any2bool($autoexec)

  file { "rclocal_${priority}_${safe_name}":
    path    => "${rclocal::params::configdir}/${priority}-${safe_name}",
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => File['/etc/rc.local.d'],
    content => $content,
  }

  if $bool_autoexec == true {
    exec { "rclocal_${priority}_${safe_name}":
      command     => "sh ${rclocal::params::configdir}/${priority}-${safe_name}",
      refreshonly => true,
      subscribe   => File[ "rclocal_${priority}_${safe_name}" ],
      path        => '/usr/bin:/bin:/usr/sbin:/sbin',
    }
  }
}

