# Helper to install git
class helpers::install::git {

    package { 'git':
        ensure => 'present',
    }

}
