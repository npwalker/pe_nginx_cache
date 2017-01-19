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

pe_nginx_cache::cache_endpoint { '/api/cm/node-counts' :
  proxy_cache_valid => '200 5m'
}

#service-alerts are updated every minute by an open browser
#cache the results so all browsers have the same results
#and aren't all talking to the status endpoint on every
#PE service
pe_nginx_cache::cache_endpoint { '/api/cm/service-alerts' :
  proxy_cache_valid => '200 59s'
}

#This is probably really unnecessary
pe_nginx_cache::cache_endpoint { '/api/license/status' :
  proxy_cache_valid => '200 1m'
}

#state-counts is used for the radiator view
#the radiator updates once per minute so if multiple
#people have it open let's not hit puppetdb for the data
pe_nginx_cache::cache_endpoint { '/api/cm/state-counts' :
  proxy_cache_valid => '200 59s'
}
