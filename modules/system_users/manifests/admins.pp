class system_users::admins {
  #create staff group { 'name':
  group { 'staff':
    ensure=>present,
    gid=>5001,
  }
  #greate  user { 'name':
  user { 'admin':
    ensure=>present,
    shell=>'/bin/csh',
    groups=>'staff',
    require=>Package['csh'],
  }
  package { 'csh':
    ensure => latest,
  }
}
