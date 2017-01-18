define pe_nginx_cache::proxy_cache_path (
  String $cache_name       = $title,
  String $path             = "/opt/puppetlabs/var/cache/pe-nginx/${cache_name}",
  String $levels           = '1:2',
  String $size             = '100m',
  String $max_size         = '1000m',
  String $inactive         = '60m',
  String $use_temp_path    = 'off',
) {

  #The following directive correctly places the proxy_cache_path setting in nginx.conf
  #However, it places it at the end of the http context block and it needs to be
  #before the include that is already there.
  #pe_nginx::directive { 'proxy_cache_path':
  #  target         => '/etc/puppetlabs/nginx/nginx.conf',
  #  server_context => undef,
  #  value          => "${path} levels=${levels} keys_zone=${cache_name}:${size} max_size=${max_size} inactive=${inactive} use_temp_path=${use_temp_path}",
  #  require        => Pe_nginx::Directive['include'],
  #}

  #We could also place this setting at the top of conf.d/proxy.conf but it has to be
  #outside of a context (i.e. you can't have another http contxt in proxy.conf)
  #However, the pe_nginx::directive doesn't allow no context.  If you do not provide
  #a context then it goes in the http context.

  #So we place proxy_cache_path in its own file managed as a file resource to allow
  #working around the above two issues.

  file { "/etc/puppetlabs/nginx/conf.d/${cache_name}.conf" :
    ensure  => present,
    content => "proxy_cache_path ${path} levels=${levels} keys_zone=${cache_name}:${size} max_size=${max_size} inactive=${inactive} use_temp_path=${use_temp_path};",
    mode    => '0644',
    notify  => Service['pe-nginx'],
  }
}
