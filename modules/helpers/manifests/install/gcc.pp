# Helper to install gcc
class helpers::install::gcc {

    package { 'gcc':
        ensure => 'present',
    }

}
