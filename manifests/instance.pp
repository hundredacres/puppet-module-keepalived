# == Define: keepalived::instance
#
# This class manages keepalived instances
#
# == Variables
#
# == Usage
#
# == Examples:
#   keepalived::instance { '50':
#     interface   => 'eth0',
#     virtual_ips => [ '192.168.200.17 dev eth0' ],
#     state       => hiera( "keepalived_50_state" ),
#     priority    => hiera( "keepalived_50_priority" ),
#   }
#
define keepalived::instance (
  $interface,
  $virtual_ips,
  $state,
  $priority,
  $track_script      = [],
  $notify            = undef,
  $notify_master     = undef,
  $notify_backup     = undef,
  $notify_fault      = undef,
  $smtp_alert        = false,
  $nopreempt         = false,
  $advert_int        = '1',
  $auth_type         = undef,
  $auth_pass         = undef,
  $virtual_router_id = $name,
) {

  include keepalived::variables

  Keepalived::Vrrp_script[ $track_script ] -> Keepalived::Instance[ $name ]

  concat::fragment { "keepalived_${name}":
    target  => $keepalived::variables::keepalived_conf,
    content => template( 'keepalived/keepalived_instance.erb' ),
    order   => '50',
    notify  => Class[ 'keepalived::service' ],
    require => Class[ 'keepalived::install' ],
  }
}
