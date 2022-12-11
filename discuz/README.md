# Discuz 3.4

- 运行

```sh
# 端口和目录酌情调整，目录需要用管理员账号到全局、上传设置里调整。
docker run -d --name discuz \
 -p 8080:80 \
 -v `pwd`/mount:/var/www/html/mount \
 axboy/discuz:3.4
```

- 备份

```sh
# 不确定要哪些文件的情况下，整个目录拷出来
docker cp discuz:/var/www/html ./discuz
```