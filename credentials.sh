#/bin/bash

echo "{
  \"Servers\":
  {
    \"rancherDefault\":
    {
      \"accessKey\":\"\",
      \"secretKey\":\"\",
      \"tokenKey\":\"\",
      \"url\":\"\",
      \"project\":\"\",
      \"cacert\":\"\"
    }
  },
  \"CurrentServer\":\"rancherDefault\"
}" > ~/.rancher/cli2.json
