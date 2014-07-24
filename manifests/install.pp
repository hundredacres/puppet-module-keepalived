# == Class: keepalived::install
#
# This class installs keepalived
#
# == Variables
#
# Refer to the keepalived class for variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by elasticsearch
#
class keepalived::install {
  package { 'keepalived':
    ensure => present,
  }
}
