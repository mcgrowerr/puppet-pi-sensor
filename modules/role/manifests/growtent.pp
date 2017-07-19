# Class to setup the growtent role
class role::growtent {

    include dht22
    include pilights::disable_network_led

}
