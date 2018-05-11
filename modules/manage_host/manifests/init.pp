# exercise 8.1
class manage_host (
  String $hostname ,
  String $ipaddr = '127.0.0.1',
  )
  {
    # create
    host { $hostname:
      ensure => 'present',
      ip     => $ipaddr,
    }
  }
