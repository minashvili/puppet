
# need install firewall_multi https://forge.puppet.com/modules/alexharvey/firewall_multi/readme 
class firewall_allow_some_ports (
  Array[String] $source = [
    '10.0.10.0/24',
    '10.0.12.0/24',
    '10.1.1.128',
  ],
  Array[Integer] $dport = [80, 443],
  Enum['accept', 'reject', 'drop'] $jump = 'accept',
) {

  package { 'iptables-services':
    ensure => installed,
  }

  -> firewall_multi { '100 allow http and https access':
    source => $source,
    dport  => $dport,
    proto  => 'tcp',
    jump   => $jump,
  }
}
