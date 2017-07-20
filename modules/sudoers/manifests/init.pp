# Class to manage basic sudoers
class sudoers {

    package { 'sudo':
        ensure => 'installed',
    }

}
