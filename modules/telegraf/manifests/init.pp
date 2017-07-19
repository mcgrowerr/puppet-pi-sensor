# This class installs telegraf on the pi
class telegraf ( $influxdb_url='http://localhost:8086', $influx_db='telegraf' ) {

    include helpers::install::curl

    group { 'telegraf':
        ensure => 'present',
        system => true,
    }
    user { 'telegraf':
        ensure  => present,
        gid     => 'telegraf',
        groups  => ['wheel'],
        home    => '/etc/telegraf',
        shell   => '/bin/false',
        system  => true,
        require => Group['telegraf'],
    }

    exec { 'download-telegraf':
        command => 'curl -o /opt/telegraf-1.3.4_linux_armhf.tar.gz https://dl.influxdata.com/telegraf/releases/telegraf-1.3.4_linux_armhf.tar.gz'
        user    => 'root',
        creates => '/opt/telegraf-1.3.4_linux_armhf.tar.gz',
        require => Class['helpers::install::curl'],
    }

    exec { 'extract-telegraf':
        command => 'tar -C /opt -xf /opt/telegraf-1.3.4_linux_armhf.tar.gz',
        user    => 'root',
        group   => 'root',
        creates => '/opt/telegraf/usr/bin/telegraf',
        require => Exec['download-telegraf'],
    }

    file { '/usr/bin/telegraf':
        ensure  => symlink,
        target  => '/opt/telegraf/usr/bin/telegraf',
        require => Exec['extract-telegraf'],
    }

    file { '/etc/telegraf':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    file { '/etc/telegraf/telegraf.conf':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0664',
        content => template('telegraf/telegraf.conf.erb'),
        notify  => Service['telegraf'],
        require => File['/etc/telegraf'],
    }

    file { '/etc/telegraf/telegraf.d':
        ensure  => 'directory',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        require => File['/etc/telegraf'],
    }

    file { '/etc/systemd/system/telegraf.service':
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('telegraf/telegraf.service.erb'),
        require => File['/usr/bin/telegraf'],
    }

    service { 'telegraf':
        ensure => 'started',
        enable => true,
    }

}
