Setting up SSL for local dev (optional)
=======================================

By default the nginx gateway container will generate a self signed cert during build. This is done in the `nginx/openssl/generate.sh` script. If you'd like to add the cert to your own CA trust list, you can copy it out of the container at runtime like this.

```bash
docker cp <container name or hash>:/etc/ssl/sse.rit.edu/server.crt ./
# on a mac you can just open the file and set it trust all in keychain.
open ./server.crt
```

You'll need to additionally either set up local dns resolution to `*.sse.local.dev` or add some `/etc/hosts` records to point to the site.
