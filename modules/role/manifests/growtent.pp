# Class to setup the growtent role
class role::growtent {
    # Setup telegraf to log data and send to influxdb_url
    class { 'telegraf':
        influxdb_url => 'http://10.10.105.106:8086',
        influx_db    => 'telegraf',
    }

    # Setup dht22 sensor read scripts
    include dht22
    include telegraf::plugins::input_dht22

    # Setup minico2 sensor read scripts
    include minico2
    include telegraf::plugins::input_minico2

    # Disable lights on the pi, enable picam
    include pilights::disable_network_led
    include helpers::enable::picam

    # setup sudo with no password for users in wheel group
    include sudo

    # Setup ssh
    include ssh::server

    # disable logging to try to extend micro sd card life
    include helpers::disable_logging
}
