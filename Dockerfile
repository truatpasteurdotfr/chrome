FROM centos:centos7
MAINTAINER Tru Huynh <tru@pasteur.fr>
#
# purpose: running Google Chrome on CentOS-7
#
# build with:
# $ docker build --rm -t truhuynh/chrome:centos7 .
#
# run without permanent volume storage:
# $ SOCK=/tmp/.X11-unix
# $ XAUTH=`mktemp`
# $ xauth nlist ${DISPLAY}| sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# $ docker run -t \
#    --net host \
#    --memory 512mb \
# -v $XSOCK:$XSOCK \
# -v $XAUTH:$XAUTH \
# -e XAUTHORITY=$XAUTH \
# -e DISPLAY=$DISPLAY \
# -v /dev/snd:/dev/snd \
# --privileged \
# truhuynh/chrome:centos7
#
# the permanent storage is mounted at /data
# you only need to add to the previous lines:
#  -v ~/shared/data:/data 

RUN yum -y update; yum clean all
RUN yum -y install mesa-dri-drivers libexif libcanberra-gtk2 libcanberra; yum clean all

ADD https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm /root/google-chrome-stable_current_x86_64.rpm

RUN yum -y install /root/google-chrome-stable_current_x86_64.rpm; yum clean all
RUN dbus-uuidgen > /etc/machine-id


CMD ["/usr/bin/google-chrome-stable", "--no-sandbox", "--user-data-dir=/data"]

