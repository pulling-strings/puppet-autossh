# = Define: autossh::tunnel::config::systemd
#
# This define deploys the config for managing this tunnel service through
# systemd
#

define autossh::tunnel::config::systemd (
  $service             = $title,
  $user                = 'root',
  $group               = 'root',
  $ssh_id_file         = '~/.ssh/id_rsa',
  $remote_user         = undef,
  $remote_host,
  $monitor_port        = 0,
  $autossh_background  = false,
  $autossh_gatetime    = undef,
  $autossh_logfile     = undef,
  $autossh_first_poll  = undef,
  $autossh_poll        = undef,
  $autossh_maxlifetime = undef,
  $autossh_maxstart    = undef,
  $ssh_config,
) {

  if (!$remote_user) {
    $real_remote_user = $user
  } else {
    $real_remote_user = $remote_user
  }

  file { "/lib/systemd/system/${service}.service":
    ensure  => file,
    owner   => $user,
    group   => $group,
    content => template('autossh/service/systemd'),
  }
}