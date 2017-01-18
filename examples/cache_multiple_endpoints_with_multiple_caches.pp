service { 'pe-nginx' :
  ensure => 'running',
}

pe_nginx_cache::proxy_cache_path { 'my_cache' : }

pe_nginx_cache::cache_endpoint { '/api/cm/facts' :
  proxy_cache_valid => '200 60m',
  proxy_cache       => 'my_cache',
}

pe_nginx_cache::proxy_cache_path { 'second_cache' : }

pe_nginx_cache::cache_endpoint { '/api/cm/nodes' :
  proxy_cache_valid => '200 5m',
  proxy_cache       => 'second_cache',
}
