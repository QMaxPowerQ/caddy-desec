FROM caddy:2.11-builder AS builder
RUN xcaddy build v2.11 \
    --with github.com/caddy-dns/desec \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@v0.14.1

FROM caddy:2.11
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
