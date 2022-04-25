# Node-WebServer

## 使用

```sh
docker run -d --name webserver \
    -v `pwd`:/app/www \
    -e API_SERVER=http://192.168.1.10:8080 \
    -e PORT=4000 \
    -p 4000:4000 \
    local/webserver
```