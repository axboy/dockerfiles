cd /chia-blockchain

#export CHIA_ROOT="~/.chia/${network}"

. ./activate
chia init
chia plots add -d ${plots_dir}
sed -i 's/localhost/127.0.0.1/g' ~/.chia/${network}/config/config.yaml
sed -i 's/WARNING/INFO/g' ~/.chia/${network}/config/config.yaml

if [[ ${plot} == 'true' ]]; then
  sleep ${sleep_time}m
  if [[ ${plot_a} == 'null' ]]; then
    chia plots create \
        -k ${plot_k} -n ${plot_n} -b ${plot_b} \
        -f ${plot_f} -p ${plot_p} \
        -t ${plot_t} -2 ${plot_2} -d ${plot_d} \
        -r ${plot_r} -u ${plot_u}
  else
    chia plots create \
        -k ${plot_k} -n ${plot_n} -b ${plot_b} \
        -f ${plot_f} -p ${plot_p} -a ${plot_a} \
        -t ${plot_t} -2 ${plot_2} -d ${plot_d} \
        -r ${plot_r} -u ${plot_u}
  fi
  echo "plot finish, exit."
  exit
fi

if [[ ${farmer} == 'true' ]]; then
  chia start farmer-only
fi

if [[ ${harvester} == 'true' ]]; then
  #chia configure --set-farmer-peer ${farmer_address}:${farmer_port}
  chia init -c /ca
  chia start harvester
fi

if [[ ${node} == 'true' ]]; then
  chia start node
fi

while true; do sleep 30; done;
#tail ~/.chia/${network}/log/debug.log -f