#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=`mktemp`
xauth nlist ${DISPLAY}| sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm -t \
    --net host \
    --cpuset 0 \
    --memory 512mb \
 -v $XSOCK:$XSOCK \
 -v $XAUTH:$XAUTH \
 -e XAUTHORITY=$XAUTH \
 -e DISPLAY=$DISPLAY \
 -v /dev/snd:/dev/snd \
 --privileged \
 truhuynh/chrome:centos7

