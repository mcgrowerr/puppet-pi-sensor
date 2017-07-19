# Class to setup the deps and script to read from dht22
class dht22( $gpio_pin='4' ) {

    include helpers::install::git
    include helpers::install::gcc
    include helpers::install::python2

    file { '/opt/Adafruit_Python_DHT':
        ensure => 'directory',
        owner  => 'alarm',
        group  => 'alarm',
        mode   => '0755',
    }

    exec { 'git-checkout-adafruit-dht':
        command => '/usr/bin/git clone https://github.com/adafruit/Adafruit_Python_DHT.git /opt/Adafruit_Python_DHT',
        unless  => '/usr/bin/test -d /opt/Adafruit_Python_DHT/.git',
        require => [ Class['helpers::install::git'], File['/opt/Adafruit_Python_DHT'] ],
    }

    exec { 'install-adafruit-dht':
        command => '/usr/bin/python2 setup.py install',
        user    => 'root',
        cwd     => '/opt/Adafruit_Python_DHT',
        unless  => '/usr/bin/test -f /usr/lib/python2.7/site-packages/Adafruit_DHT-1.3.2-py2.7-linux-armv7l.egg',
        require => [ Class['helpers::install::python2'], Exec['git-checkout-adafruit-dht'], Class['helpers::install::gcc'] ],
    }

    file { '/usr/local/bin/read_dht22.py':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('dht22/read_dht22.py.erb'),
    }

}
