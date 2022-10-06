# Define rclocal::script
#
# @summary This define creates a single script in /etc/rc.local/.d that is executed by /etc/rc.local at boot time
#
# @example Usage:
#   rclocal::script { "set_route":
#     priority => "10",
#     content  => "route add -net 10.42.0.0/24 gw 10.42.10.1 \n",
#   }
#
# @param ensure
#   Should the snippet be added or removed? Only takes 'present' or 'absent',
#   defaults to present
#
# @param priority
#   Order number for your snippet. Is used to order rc.local snippets by filename
#   Must be a string, defaults to '50'
#
# @param autoexec
#   Should the snippet be executed upon actual puppet run? Needs boolean value.
#
# @param content
#   The code which should be added to snippet file. Must be string.
#
# Priority influences the execution order while content contains the script
# to be executed. Can be also a template, had has the same syntax of the
# content param in the file type.
#
define rclocal::script (
  Enum['absent', 'present'] $ensure   = 'present',
  String[1]                 $priority = '50',
  Boolean                   $autoexec = true,
  Optional[String[1]]       $content  = undef,
) {
  include rclocal

  $safe_name = regsubst($title, '/', '_', 'G')

  file { "rclocal_${priority}_${safe_name}":
    ensure  => $ensure,
    path    => "${rclocal::config_dir}/${priority}-${safe_name}",
    mode    => '0755',
    owner   => 'root',
    group   => '0',
    content => $content,
  }

  if $autoexec == true and $ensure == 'present' {
    exec { "rclocal_${priority}_${safe_name}":
      command     => "sh ${rclocal::config_dir}/${priority}-${safe_name}",
      refreshonly => true,
      subscribe   => File["rclocal_${priority}_${safe_name}"],
      path        => '/usr/bin:/bin:/usr/sbin:/sbin',
    }
  }
}
