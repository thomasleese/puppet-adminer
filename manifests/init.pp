# == Class: adminer
#
# This module manages an Adminer installation.
#
# === Parameters
#
# [*location*]
#   Where to download Adminer. Defaults to '/srv/adminer'.
#
# [*owner*]
#   The owner of the Adminer files. Defaults to 'www-data'.
#
# [*group*]
#   The group of the Adminer files. Defaults to 'www-data'.
#
# === Examples
#
# class { 'adminer': }
#
class adminer($location = '/srv/adminer',
              $owner = 'www-data',
              $group = 'www-data') {

    file { $location:
        ensure => directory,
        owner => $owner,
        group => $group,
        mode  => 0770,
    }

    exec { "download adminer to ${location}":
        command => "wget http://www.adminer.org/latest.php -O ${location}/index.php",
        creates => "${location}/index.php",
        require => File[$location],
        path    => ['/usr/bin', '/usr/share/bin'],
    } ->
    file { "${location}/index.php":
        ensure => file,
        owner  => $owner,
        group  => $group,
        mode   => 0440,
    }

}
