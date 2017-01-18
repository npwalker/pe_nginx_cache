service { 'pe-nginx' :
  ensure => 'running',
}

include pe_nginx_cache::proxy_cache_path

pe_nginx_cache::cache_endpoint { '/api/cm/facts' :
  proxy_cache_valid => '200 60m'
}

pe_nginx_cache::cache_endpoint { '/api/cm/nodes' :
  proxy_cache_valid => '200 5m'
}
