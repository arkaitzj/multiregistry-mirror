# arkaitzj/multiregistry-mirror
Multiregistry mirror for docker registries, it allows you to bring all your images together from any registry.  
If you run through all your images while connected to the internet you wll be able to disconnect and have them ready in the cache.

# Usage
Just run the registry mapped to any port (listens at 5000) and mount, if you'd like, your cache dir or volume on /data/nginx/cache

     docker run -it --rm -v${PWD}/nginx-cache:/data/nginx/cache -p 5002:5000 arkaitzj/multiregistry-mirror
     
Afterwards, you need to configure your cluster to use this as a generic wildcard mirror.  
In principle, all cri based clusters should allow a wildcard setting of `*` to select all repositories for a mirror.

## k3d
As an example, k3d would be configured like this:

    registries:
      config: |
        mirrors:
         "*":
           endpoint:
             - http://host.docker.internal:5002
             
