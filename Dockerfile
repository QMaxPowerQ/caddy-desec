FROM caddy:2.11-builder AS builder
# xcaddy braucht eine volle Semver ("v2.11" allein ist invalid) – Version aus
# dem gleitenden Builder-Image lesen, damit nur Patch-Updates einfließen.
RUN xcaddy build "$(caddy version | awk '{print $1}')" \
    --with github.com/caddy-dns/desec \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@v0.14.1

FROM caddy:2.11
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
