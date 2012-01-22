#
class graphite::config::graphite {

  Exec {
     path => "/bin:/usr/bin",
     cwd => "/root/",
  }

  exec {"configure carbon":
     cwd     => "/opt/graphite/conf",
     command => "cp carbon.conf.example carbon.conf",
  }

  exec {"configure carbon storage-schemas":
     cwd     => "/opt/graphite/conf",
     command => "cp storage-schemas.conf.example storage-schemas.conf",
  }
  
}
