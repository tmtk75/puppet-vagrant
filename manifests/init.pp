class vagrant {
  case $operatingsystem {
    'Darwin' : { include vagrant::darwin }
    'CentOS' : { include vagrant::centos }
  }
}

class vagrant::centos {
  exec { vagrant:
    command => "rpm -Uvh https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.rpm",
    creates => "/usr/bin/vagrant",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
}

class vagrant::darwin {
  $version = "1.4.3"

  package { "Vagrant-${version}.dmg":
    ensure   => installed,
    source   => "https://dl.bintray.com/mitchellh/vagrant/Vagrant-${version}.dmg",
    provider => 'pkgdmg'
  }
}
