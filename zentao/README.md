# 禅道开源版(使用外部数据库)

## 运行

```
docker run -d --name zentao \
  -p 8080:80 \
  -v `pwd`/upload:/var/www/html/www/data/upload \
  axboy/zentao:15.2
```

## 访问

http://localhost:8080/www/

## 文档

- [使用源码包安装](https://www.zentao.net/book/zentaopmshelp/101.html)
