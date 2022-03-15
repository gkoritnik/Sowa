FROM ubuntu

MAINTAINER Gregor Koritnik


COPY system_info.sh /opt
RUN chmod +x /opt/system_info.sh

#CMD ["/opt/system_info.sh"]
ENTRYPOINT ["/opt/system_info.sh"] 
