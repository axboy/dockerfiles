# Chia docker

## Full node

```
docker run -d --name chia-node \
    -p 8444:8444 \
    -v `pwd`/db:~/.chia/mainnet/db \
    -e node=true \
    axboy/chia
```

## Farmer

```
docker run -d --name chia-farmer \
    -v `pwd`/plots:/plots:ro \
    -p 8447:8447 \
    -e farmer=true \
    axboy/chia
```

__Need edit config.yaml, not support command__

## Harvester

```
docker run -d --name chia-harvester \
    -e harvester=true \
    -v {ca_dir}:/ca \
    axboy/chia

chia configure --set-farmer-peer ${farmer_address}:${farmer_port}
```

## Plot

```
docker run -d --name chia-plot \
    --memory 6g \
    -e plot=true \
    -e plot_f={xxx} \
    -e plot_p={xxx} \
    -e plot_t=/mnt/tmp \
    -e plot_d=/mnt/output \
    -v {ssd_path}:/mnt/tmp \
    -v {hdd_path}:/mnt/output \
    axboy/chia
```