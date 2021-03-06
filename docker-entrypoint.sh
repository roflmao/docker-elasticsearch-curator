#!/bin/bash

set -ex

# Add curator as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- curator "$@"
fi

# Step down via gosu  
if [ "$1" = 'curator' ]; then
  # Wait 10 seconds for all other services to start before starting run this script
  sleep 10
  exec gosu curator bash -c "while true; do curator --config /opt/config/curator.yml /opt/config/actionfile.yml; set -e; sleep $(( 60*60*INTERVAL_IN_HOURS )); set +e; done"
fi

# As argument is not related to curator,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
