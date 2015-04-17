#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=`mktemp`
xauth nlist ${DISPLAY}| sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run -t \
    --net host \
    --cpuset 0 \
    --memory 512mb \
 -v $XSOCK:$XSOCK \
 -v $XAUTH:$XAUTH \
 -e XAUTHORITY=$XAUTH \
 -e DISPLAY=$DISPLAY \
 -v /dev/snd:/dev/snd \
 -v ~/shared/data:/data \
 --privileged \
 truhuynh/chrome

