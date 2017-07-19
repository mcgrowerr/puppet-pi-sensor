# Class to setup the growtent role
class role::growtent {

    include dht22
    include pilights::disable_network_led

    class { 'telegraf':
        influxdb_url => 'http://10.10.105.106:8086',
        influx_db    => 'telegraf',
    }

    class { 'telegraf::plugins::input_dht22':
        require => [ Class['dht22'], Class['telegraf'] ],
    }

}
