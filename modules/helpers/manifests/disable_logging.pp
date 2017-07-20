# Class to disable logging
class helpers::disable_logging {

    file { '/etc/systemd/journald.conf.d':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    file { '/etc/systemd/journald.conf.d/disable_logging.conf':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('helpers/disable_logging.conf.erb'),
        require => File['/etc/systemd/journald.conf.d'],
    }
}
