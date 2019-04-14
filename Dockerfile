FROM alpine:latest

RUN mkdir -p /dhcp/config \
    && mkdir -p /dhcp/leases \
    && touch /dhcp/leases/dhcpd.leases \
    && apk add --no-cache dhcp

CMD ["/usr/sbin/dhcpd", "-user", "dhcp", "-f", "--no-pid", "-cf", "/dhcp/config/dhcpd.conf", "-lf", "/dhcp/leases/dhcpd.leases"]
