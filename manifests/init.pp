class vagrant {
  case $operatingsystem {
    'Darwin' : { include vagrant::darwin }
    'CentOS' : { include vagrant::centos }
  }
}

class vagrant::centos {
  exec { vagrant:
    command => "rpm -Uvh https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.0_x86_64.rpm",
    creates => "/usr/bin/vagrant",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
}

class vagrant::darwin {
  $version = "1.5.0"

  package { "Vagrant-${version}.dmg":
    ensure   => installed,
    source   => "https://dl.bintray.com/mitchellh/vagrant/Vagrant-${version}.dmg",
    provider => 'pkgdmg'
  }
}
