# = Class: autossh::params
#
# This class detects operating system dependent variables.
# Change Class to Define if needed.
#
class autossh::params {
  case $::operatingsystem {
    /^(RedHat|CentOS)$/: {
      if $::operatingsystemmajrelease >= 7 {
        $service = 'systemd'
      } else {
        $service = 'init'
      }
    }
    /^(Fedora)$/: {
      if $::operatingsystemmajrelease >= 15 {
        $service = 'systemd'
      } else {
        $service = 'init'
      }
    }
    /^(Ubuntu)$/: {
      $service = 'init'
    }
    default: {
      # FIXME: can we detect systemd and use it?
      fail("Unsupported operating system ${::operatingsystem}")
    }
  }

}
