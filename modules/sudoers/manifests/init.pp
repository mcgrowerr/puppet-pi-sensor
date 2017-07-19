# Class to manage basic sudoers
class sudoers {

    package { 'sudoers':
        ensure => 'installed',
    }

}
