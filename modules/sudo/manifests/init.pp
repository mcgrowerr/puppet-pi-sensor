# Class to manage basic sudoers
class sudo {

    package { 'sudo':
        ensure => 'installed',
    }

    file { '/etc/sudoers':
        ensure => 'latest',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

}
