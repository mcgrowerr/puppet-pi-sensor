# Helper to install curl
class helpers::install::curl {

    package { 'curl':
        ensure => 'present',
    }

}
