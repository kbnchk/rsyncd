FROM alpine:latest
RUN apk add --no-cache rsync
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 873
ENTRYPOINT ["/entrypoint.sh"]