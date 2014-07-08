#!/bin/bash

cat << EOF > /tmp/config.json
{
  "network": {
    "servers": [ "$LOGSTASH_SERVER" ],
    "ssl certificate": "/opt/certs/logstash-forwarder.crt",
    "ssl key": "/opt/certs/logstash-forwarder.key",
    "ssl ca": "/opt/certs/logstash-forwarder.crt",
    "timeout": 15
  },
  "files": [
    {
      "paths": [ "/dev/log" ],
      "fields": { "type": "devlog" }
    }
  ]
}
EOF

/opt/lumberjack/bin/lumberjack -config /tmp/config.json
