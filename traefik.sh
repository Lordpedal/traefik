#!/bin/bash
docker run -d \
        --name traefik \
        --network traefik \
        --restart always \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $PWD/lordpedal.toml:/traefik.toml \
        -v $PWD/acme.json:/acme.json \
        -e DUCKDNS_TOKEN=c84c43be-b5c2-4d61-be19-fef923b46297 \
        -e "GODEBUG=tls13=1" \
        -p 80:80 \
        -p 443:443 \
        -p 8080:8080 \
        -l traefik.enable=true \
        -l traefik.frontend.rule=Host:dashboard.lordpedal.duckdns.org \
        -l traefik.port=8080 \
        -l traefik.frontend.entryPoints=https \
        -l traefik.frontend.passHostHeader=true \
        -l traefik.frontend.headers.SSLForceHost=true \
        -l traefik.frontend.headers.SSLHost=dashboard.lordpedal.duckdns.org \
        -l traefik.frontend.headers.SSLRedirect=true \
        -l traefik.frontend.headers.browserXSSFilter=true \
        -l traefik.frontend.headers.contentTypeNosniff=true \
        -l traefik.frontend.headers.forceSTSHeader=true \
        -l traefik.frontend.headers.STSSeconds=315360000 \
        -l traefik.frontend.headers.STSIncludeSubdomains=true \
        -l traefik.frontend.headers.STSPreload=true \
        -l traefik.frontend.headers.customResponseHeaders=X-Robots-Tag:noindex,nofollow,nosnippet,noarchive,notranslate,noimageindex \
        -l traefik.frontend.headers.frameDeny=true \
        traefik:maroilles-alpine
