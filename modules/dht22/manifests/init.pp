# Class to setup the deps and script to read from dht22
class dht22 {

    include helpers::install::git
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
        require => [ Class['helpers::install::python2'], Exec['git-checkout-adafruit-dht'] ],
    }

}
