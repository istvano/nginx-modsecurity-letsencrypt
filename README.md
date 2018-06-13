# ModSecurity Docker Image

[hub]: https://hub.docker.com/r/owasp/modsecurity

## What is ModSecurity

ModSecurity is an open source,
cross platform
web application firewall (WAF) engine
for Apache, IIS and Nginx

## How to use this image

Build the image:

```
docker build -t nginx-modsecurity-letsencrypt .
```

Run the Image:

```
docker run -ti --rm -p 80:80 nginx-modsecurity-letsencrypt
```

Check image

```
docker run -ti --rm nginx-modsecurity-letsencrypt bash
```

This will start an Apache Webserver,
on port 80,
with ModSecurity installed.

You can access this webserver typically by
navigating to [http://localhost](http://localhost)

You can test if it is working
```
http://localhost/?param=%22%3E%3Cscript%3Ealert(1);%3C/script%3E
```

check the following log file cat /var/log/modsec_audit.log

the OWASP Core Rule Set (CRS) has been added
is available free on [GitHub](https://github.com/SpiderLabs/owasp-modsecurity-crs/).



## Configuration

At this point,
there are no configuration options
for this image.

## License

License: Apache 2.0 license, see [LICENSE](LICENSE).
