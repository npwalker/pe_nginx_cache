service { 'pe-nginx' :
  ensure => 'running',
}

include pe_nginx_cache::proxy_cache_path
class { 'pe_nginx_cache::cache_endpoint' :
  endpoint          => '/api/cm/facts',
  proxy_cache_valid => '200 60m'
}
