FROM debian:latest

ADD eve.sh /bin/eve.sh
RUN chmod +x /bin/eve.sh

ENTRYPOINT /bin/eve.sh
