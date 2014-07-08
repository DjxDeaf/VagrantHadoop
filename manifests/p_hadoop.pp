node 'hadoopnode' {
  #Installing Java
  class { 'java':}
  #Downloading Hadoop 2.4.1
  exec{'hadoop_download':
    command => "sudo wget -P /tmp/downloads http://apache.spd.co.il/hadoop/common/current2/hadoop-2.4.1.tar.gz",
    path => "/usr/local/bin:/bin:/usr/bin",
    creates => "/tmp/downloads/hadoop-2.4.1.tar.gz",
    ensure => absent,
    before => Exec['extract_hadoop'],
  }
#Extracting Hadoop tar
  exec{'extract_hadoop':
    command => "sudo tar xzvf /tmp/downloads/hadoop-2.4.1.tar.gz -C /tmp/downloads",
    path => "/usr/local/bin:/bin:/usr/bin",
    require => File['hadoop-2.4.1.tar.gz'],
  }
#Making sure the tar exists before extracting
  file{'/tmp/downloads/hadoop-2.4.1.tar.gz':
    ensure  => present,
#    before => Exec['extract_hadoop'],
  }
}