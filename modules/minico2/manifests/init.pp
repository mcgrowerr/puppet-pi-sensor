# Class to setup the script to read from minico2
class minico2 {

    file { '/usr/local/bin/read_minico2.py':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('minico2/read_minico2.py.erb'),
    }

    file { '/usr/local/bin/read_minico2.sh':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('minico2/read_minico2.sh.erb'),
    }

}
