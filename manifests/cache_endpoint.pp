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

  pe_nginx::directive { "${endpoint}-proxy_pass":
    directive_name   => 'proxy_pass',
    value            => $proxy_pass,
  }

  pe_nginx::directive { "${endpoint}-proxy_redirect":
    directive_name   => 'proxy_redirect',
    value            => $proxy_redirect,
  }

  pe_nginx::directive { "${endpoint}-proxy_cache_valid":
    directive_name   => 'proxy_cache_valid',
    value            => $proxy_cache_valid,
  }

  pe_nginx::directive { "${endpoint}-proxy_cache":
    directive_name   => 'proxy_cache',
    value            => $proxy_cache,
  }

  pe_nginx::directive { "${endpoint}-proxy_ignore_headers":
    directive_name   => 'proxy_ignore_headers',
    value            => $proxy_ignore_headers,
  }

  pe_nginx::directive { "${endpoint}-proxy_cache_lock":
    directive_name   => 'proxy_cache_lock',
    value            => $proxy_cache_lock,
  }

  pe_nginx::directive { "${endpoint}-add_header":
    directive_name   => 'add_header',
    value            => $add_header,
  }
}
