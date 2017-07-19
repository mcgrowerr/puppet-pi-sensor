# This class disables the network led on the pi
class pilights::disable_network_led {
    file { '/usr/local/bin/disable_network_led':
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('pilights/disable_network_led.erb'),
    }

    file { '/etc/systemd/system/disable_network_led.service':
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('pilights/disable_network_led.service.erb'),
        require => File['/usr/local/bin/disable_network_led'],
    }

    service { 'disable_network_led':
        ensure  => 'running',
        enable  => true,
        require => File['/etc/systemd/system/disable_network_led.service'],
    }
}
