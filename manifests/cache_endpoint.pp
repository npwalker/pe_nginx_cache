define pe_nginx_cache::cache_endpoint (
  String $endpoint             = $title,
  String $proxy_pass           = 'http://127.0.0.1:4430',
  String $proxy_redirect       = 'default',
  String $proxy_cache_valid    = '200 5m',
  String $proxy_cache          = 'my_cache',
  String $proxy_ignore_headers = 'Cache-Control',
  String $proxy_cache_lock     = 'on',
  String $add_header           = 'X-Cache-Status $upstream_cache_status'
){

  Pe_nginx::Directive {
    target           => '/etc/puppetlabs/nginx/conf.d/proxy.conf',
    server_context   => $::clientcert,
    location_context => $endpoint,
  }

  pe_nginx::directive { 'proxy_pass':
    value            => $proxy_pass,
  }

  pe_nginx::directive { 'proxy_redirect':
    value            => $proxy_redirect,
  }

  pe_nginx::directive { 'proxy_cache_valid':
    value            => $proxy_cache_valid,
  }

  pe_nginx::directive { 'proxy_cache':
    value            => $proxy_cache,
  }

  pe_nginx::directive { 'proxy_ignore_headers':
    value            => $proxy_ignore_headers,
  }

  pe_nginx::directive { 'proxy_cache_lock':
    value            => $proxy_cache_lock,
  }

  pe_nginx::directive { 'add_header':
    value            => $add_header,
  }
}
