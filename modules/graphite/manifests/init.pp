#
class graphite {


  package {
    ["apache2", "apache2-mpm-worker", "apache2-utils", "apache2.2-bin", "apache2.2-common", "libapr1", "libaprutil1", "libaprutil1-dbd-sqlite3", "python3.1", "libpython3.1", "python3.1-minimal", "libapache2-mod-wsgi", "libaprutil1-ldap", "memcached", "python-cairo-dev", "python-django", "python-ldap", "python-memcache", "python-pysqlite2", "sqlite3", "erlang-os-mon", "erlang-snmp", "rabbitmq-server", "bzr", "expect", "ssh", "libapache2-mod-python", "python-setuptools", "python-django-tagging"]:
    ensure => installed,
  }

  Exec {
     path => "/bin:/usr/bin",
     cwd => "/root/",
  }

  exec {"download graphite-web":
     command => "wget http://launchpad.net/graphite/0.9/0.9.9/+download/graphite-web-0.9.9.tar.gz -O graphite-web.tar.gz",
  }

  exec {"download carbon":
     command => "wget http://launchpad.net/graphite/0.9/0.9.9/+download/carbon-0.9.9.tar.gz -O carbon.tar.gz",
  }

  exec {"download whisper":
    command => "wget http://launchpad.net/graphite/0.9/0.9.9/+download/whisper-0.9.9.tar.gz -O whisper.tar.gz",
  }

  exec {"extract graphite-web":
    command => "rm -rf graphite-web; tar -zxvf graphite-web.tar.gz && mv graphite-web-0.9.9 graphite-web",
    require => Exec["download graphite-web"],
  }
  

  exec {"extract carbon":
    command => "rm -rf carbon; tar -zxvf carbon.tar.gz && mv carbon-0.9.9 carbon",
    require => Exec["download carbon"],
  }
  

  exec {"extract whisper":
    command => "rm -rf whisper; tar -zxvf whisper.tar.gz && mv whisper-0.9.9 whisper",
    require => Exec["download whisper"],
  }
  
  
  exec {"install whisper":
    cwd     => "/root/whisper",
    command => "python setup.py install",
    require => Exec["extract whisper"],
  }

  exec {"install carbon":
    cwd     => "/root/carbon",
    command => "python setup.py install",
    require => Exec["extract whisper"],
  }

  include 'graphite::config::carbon'
  
  exec {"install graphite-web":
    cwd     => "/root/graphite-web",
    command => "python check-dependencies.py && python setup.py install",
    require => Exec["extract whisper"],
  }

  include 'graphite::config::apache'

  file { ['/etc/httpd','/etc/httpd/wsgi']:
    ensure => directory,
  }

}


