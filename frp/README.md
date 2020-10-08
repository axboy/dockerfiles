# [doc](https://github.com/fatedier/frp)

- client

```
docker run -d --name frpc \
  --network host \
  -v `pwd`/frpc.ini:/frp/frpc.ini \
  axboy:0.33.0 \
  /frp/frpc -c /frp/frpc.ini
```

- server

```
docker run -d --name frps \
  --network host \
  -v `pwd`/frps.ini:/frp/frps.ini \
  axboy:0.33.0 \
  /frp/frps -c /frp/frps.ini
```