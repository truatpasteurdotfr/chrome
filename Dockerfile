FROM centos:centos7
MAINTAINER Tru Huynh <tru@pasteur.fr>

RUN yum -y update; yum clean all
RUN yum -y install mesa-dri-drivers libexif libcanberra-gtk2 libcanberra; yum clean all

ADD https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm /root/google-chrome-stable_current_x86_64.rpm

RUN yum -y install /root/google-chrome-stable_current_x86_64.rpm; yum clean all
RUN dbus-uuidgen > /etc/machine-id


CMD ["/usr/bin/google-chrome-stable", "--no-sandbox", "--user-data-dir=/data"]

