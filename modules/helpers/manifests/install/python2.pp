# Helper to install python2
class helpers::install::python2 {

    package { 'python2':
        ensure => 'present',
    }

}
