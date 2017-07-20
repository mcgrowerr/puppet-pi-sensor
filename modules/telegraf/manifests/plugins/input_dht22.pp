# This class installs dht_22 input into telegraf
class telegraf::plugins::input_dht22 {
    include dht22

    file { '/etc/telegraf/telegraf.d/dht22.conf':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('telegraf/plugins/input_dht22.conf.erb'),
        notify  => Service['telegraf'],
        require => Class['dht22'],
    }
}
