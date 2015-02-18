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
