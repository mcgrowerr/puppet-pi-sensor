# Class to manage basic sudoers
class sudo {

    package { 'sudo':
        ensure => 'installed',
    }

    file { '/etc/sudoers':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('sudo/sudoers.erb'),
    }

}
