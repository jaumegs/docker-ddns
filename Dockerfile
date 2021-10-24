FROM alpine:latest

COPY update-ddns.sh /usr/local/bin/update-ddns.sh

RUN apk add --no-cache curl jq

USER 10000

CMD ["/usr/local/bin/update-ddns.sh"]
