# How to use

In order to setup caching for different console middleware endpoints you need
two things.  

1.  `include pe_nginx_cache::proxy_cache_path`

This configures nginx's cache on disk.

2.  ```pe_nginx_cache::cache_endpoint { '/path/to/endpoint' :
  proxy_cache_valid => '200 <duration>'
}```

This defined type configures multiple settings in nginx that enable caching for
that endpoint.  You can find an endpoint you want to cache by looking in chrome
dev tools.  You likely want to change the `proxy_cache_valid` setting which is
what determines how long the endpoint data will be cached for.  The default is
5m but you may want longer or shorter depending on the endpoint.  

# Examples

Look in the examples directory.  
