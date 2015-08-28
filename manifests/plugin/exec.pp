# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2 foldmethod=marker
#
# == Class: stackdriver::plugin::exec
#
# Enable Exec Agent Plugin for Stackdriver Agent
#
# === Parameters
# ---
#
# [*config*]
# - Default - /opt/stackdriver/collectd/etc/collectd.d/exec.conf
# - Plugin configuration file
#
# [*execs*]
# - Default - []
# - Array of "Exec 'user:group' '/path/to/commdand' 'arg0' 'arg1' ..." lines - REQUIRED
#
# === Usage
# ---
#
# ==== Hiera
#
#  Enable Exec plugin via Hiera:
#
#  stackdriver::plugins:
#   - exec
#
# ==== Puppet Code
#
#  Enable Exec plugin via Puppet CODE:
#
#  include '::stackdriver::plugin::exec'
#
class stackdriver::plugin::exec(

  $config   = '/opt/stackdriver/collectd/etc/collectd.d/exec.conf',
  $execs    = [],

) {

  Class['stackdriver'] -> Class[$name]

  validate_absolute_path  ( $config   )
  validate_array          ( $execs    )

  contain "${name}::config"

}

