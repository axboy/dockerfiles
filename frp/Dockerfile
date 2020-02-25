FROM alpine:3.10.3
MAINTAINER axboy

ENV TZ="Asia/Shanghai" PLATFORM="linux_386" FRP_VERSION="0.29.0"
RUN build_pkgs="wget tar" \
    && wget -O /tmp/frp.tar.gz "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${PLATFORM}.tar.gz" \
    && tar -xzf /tmp/frp.tar.gz -C / \
    && mv /frp* /frp \
    && rm -f /tmp/frp.tar.gz

CMD ["/frp/frps", "-c", "/frp/frps.ini"]