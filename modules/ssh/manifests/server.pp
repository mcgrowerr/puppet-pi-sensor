# class to setup an ssh server
class ssh::server {
    package { 'openssh':
        ensure => 'installed',
    }

    service { 'sshd':
        ensure  => 'running',
        enable  => true,
        require => Package['openssh'],
    }
}
