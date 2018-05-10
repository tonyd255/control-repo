class system_users {
# create the fundamentals user { 'name':
  user { 'fundamentals':
    ensure => present,
    # comment => 'First Last',
    # home => '/home/',
     password => 'ZmxpYmJlcnR5Z2liYml0Cg==',
     ##groups => 'sysadmin',
     shell => '/bin/bash',
    # uid => '501',
    # gid => '20',
  }
    # group { 'sysadmin':
    # ensure  => present,
    # }
  
}
