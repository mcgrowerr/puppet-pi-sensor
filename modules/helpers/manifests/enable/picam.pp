# class to enable the pi cam
## requires reboot
class helpers::enable::picam {
    file { '/boot/config.txt':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('helpers/config.txt.erb'),
    }
}
