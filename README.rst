Adminer Puppet Module
=====================

Puppet module to configure Adminer.

Examples
--------

.. code-block:: puppet

    class { 'adminer':
        location => '/var/www/data',
        owner    => 'www-data',
        group    => 'www-data',
    }
