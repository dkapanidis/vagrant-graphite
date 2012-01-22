#
class graphite::config::carbon {

  Exec {
     path => "/bin:/usr/bin",
     cwd => "/root/",
  }

  exec {"configure carbon":
     cwd     => "/opt/graphite/conf",
     command => "cp carbon.conf.example carbon.conf",
  }

  file {'/opt/graphite/conf/storage-schemas.conf':
    content  => template('graphite/storage-schemas.conf.erb'),

  }
}
