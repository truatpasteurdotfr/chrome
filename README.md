dockerfiles-centos-chrome
=========================

CentOS 7 dockerfile for Google Chrome

To build:

    # docker build --rm -t truhuynh/chrome:centos7 .

Run the chrome browser inside docker with a permanent storage (in this case ~/shared/data):
~/shared/data will be mapped to /data inside the container, and will provide the permanent storage for chrome.

    # docker run -ti --memory 512mb --net host  -e DISPLAY=$DISPLAY -v /dev/snd:/dev/snd -v ~/shared/data:/data --privileged  truhuynh/chrome:centos7 

Run a pristine chrome browser inside docker, without any previous configuration:

    # docker run -ti --memory 512mb --net host  -e DISPLAY=$DISPLAY -v /dev/snd:/dev/snd --privileged  truhuynh/chrome:centos7 

