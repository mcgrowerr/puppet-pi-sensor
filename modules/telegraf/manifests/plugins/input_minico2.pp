# This class installs minico2 input into telegraf
class telegraf::plugins::input_minico2 {
    include minico2

    file { '/etc/telegraf/telegraf.d/minico2.conf':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('telegraf/plugins/input_minico2.conf.erb'),
        notify  => Service['telegraf'],
        require => Class['minico2'],
    }
}
