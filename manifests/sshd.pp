class vagrant::sshd {

  file { '/home/vagrant/.ssh/id_rsa':
    ensure => file,
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   =>  0600,
    source => 'puppet:///modules/vagrant/id_rsa'
  }

  file { '/home/vagrant/.ssh/id_rsa.pub':
    ensure => file,
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   =>  0600,
    source => 'puppet:///modules/vagrant/id_rsa.pub'
  }

}

