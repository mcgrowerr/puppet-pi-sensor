# Class to setup the growtent role
class role::growtent {

    include dht22
    include minico2
    include pilights::disable_network_led
    include sudoers

    class { 'telegraf':
        influxdb_url => 'http://10.10.105.106:8086',
        influx_db    => 'telegraf',
    }

    include telegraf::plugins::input_dht22
    include telegraf::plugins::input_minico2

    # disable logging to try to extend micro sd card life
    include helpers::disable_logging
}
