#/bin/bash

#mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`
varnishd  \
-P /var/run/varnish.pid \
	-f $VARNISH_VCL_CONF \
	-a :${VARNISH_LISTEN_PORT} \
	-T ${VARNISH_ADMIN_LISTEN_ADDRESS}:${VARNISH_ADMIN_LISTEN_PORT} \
	-t $VARNISH_TTL \
	-u $VARNISH_USER \
	-g $VARNISH_GROUP \
	-S $VARNISH_SECRET_FILE \
	-s $VARNISH_STORAGE \
    -p thread_pool_min=5 -p thread_pool_max=500 -p thread_pool_timeout=300
sleep 2
varnishlog
