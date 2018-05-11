# this class exercise 8.2
class nginx (
  String $docroot = "/var/www",
  String $port    = "80",
  )
{
# this should work for both windows and unix system_users
# if windows do this other wise do the other
if  $facts['kernel'] == 'windows'
  {
      include chocolatey
  # check for the
    # file { 'c:\ProgramData\nginx\html':
    #   ensure => present,
    #   mode   => '0755',
    #   owner  => 'Admin',
    # }
    package { 'nginx':
      ensure   => installed,
      provider => 'chocolatey'
    }
  }
  else
  {
    # this is the unix leg
    #file {'/var/www/html':
    #  ensure => present,
    #}
    # use the unix packagr
    package { 'nginx':
      ensure  => latest,
    }
    file { '/etc/nginx/sites-available/default':
      ensure  => file,
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
      content => template("${module_name}/default.erb"),
      require => Package['nginx'],
      notify  => Service['nginx'],
    }
    service {'nginx':
      ensure   => running,
      require  => Package['nginx'],
    }
    file { $docroot:
      owner    => 'www-data',
      group    => 'www-data',
      mode     => '0755',
      require  => Package['nginx'],
    }
    file { "{$docroot}/index.html":
      owner    => 'www-data',
      group    => 'www-data',
      mode     => '0755',
      source   => "puppet:///modules/${module_name}/index.html",
      require  => File["${docroot}"],
    }
  }
}
