# === Class: keepalived::service
#
# This class manages the keepalived service
#
# == Variables
#
# Refer to keepalived class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by keepalived
#
class keepalived::service {
  service { 'keepalived':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    pattern   => 'keepalived',
  }
}
