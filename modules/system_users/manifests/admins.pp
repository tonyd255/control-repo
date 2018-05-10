# system_users class for users in windows and unix
class system_users::admins {
  #create staff group { 'name':
  group { 'staff':
    ensure => present,
  }
  # check to see if windows
  if $facts['kernel'] == 'windows'
  {
    #greate  user { 'name':
    user { 'admin':
        ensure => present,
        groups => 'staff',
    }
  }
  else
  {
    # add pacakge csh
    package { 'csh':
      ensure => latest,
    }
  #create  user { 'name':
    user { 'admin':
      ensure  => present,
      shell   => '/bin/csh',
      groups  => 'staff',
      require => Package['csh'],
    }
  }
}
