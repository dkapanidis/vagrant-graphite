#
class graphite::config::apache {

  file {'/etc/apache2/sites-available/default':
    content => template('graphite/example-graphite-vhost.conf.erb'),
  }

  file {'/opt/graphite/conf/graphite.wsgi':
    source => '/opt/graphite/conf/graphite.wsgi.example',
  }
}
