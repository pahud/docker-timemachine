FROM cptactionhank/netatalk

MAINTAINER Pahud Hsieh <pahudnet@gmail.com>

ADD start_services.sh /start_services.sh
ADD netatalk/AppleVolumes.default /etc/netatalk/AppleVolumes.default
ADD netatalk/afp.conf /etc/netatalk/afp.conf

CMD [ "/bin/bash", "/start_services.sh" ]
