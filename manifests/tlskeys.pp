class logstash::tlskeys {
    $tls_dir = [ "/etc/pki/tls/certs", "/etc/pki/tls/private" ]

    $tls_cert = "${tls_dir[0]}/logstash-forwarder.crt"
    $tls_key = "${tls_dir[1]}/logstash-forwarder.key"

    file { ["/etc/pki", "/etc/pki/tls", $tls_dir] : ensure => "directory"}

    file { $tls_key:
        ensure => 'present',
        source => 'puppet:///modules/logstash/logstash-forwarder.key'
    }

    file { $tls_cert:
        ensure => 'present',
        source => 'puppet:///modules/logstash/logstash-forwarder.crt'
    }
}

