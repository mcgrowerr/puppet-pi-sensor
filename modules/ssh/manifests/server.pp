# class to setup an ssh server
class ssh::server {
    package { 'openssh':
        ensure => 'installed',
    }

    service { 'openssh':
        ensure  => 'running',
        enable  => true,
        require => Package['openssh'],
    }
}
