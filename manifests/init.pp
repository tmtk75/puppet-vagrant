class vagrant {

  $version = "1.6.2"

  case $operatingsystem {
    'Darwin' : { include vagrant::darwin }
    'CentOS' : { include vagrant::centos }
  }
}

class vagrant::centos {
  exec { vagrant:
    command => "rpm -Uvh https://dl.bintray.com/mitchellh/vagrant/vagrant_${vagrant::version}_x86_64.rpm",
    creates => "/usr/bin/vagrant",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
}

class vagrant::darwin {

  package { "Vagrant-${vagrant::version}.dmg":
    ensure   => "version",
    source   => "https://dl.bintray.com/mitchellh/vagrant/Vagrant-${vagrant::version}.dmg",
    provider => 'pkgdmg'
  }
}
