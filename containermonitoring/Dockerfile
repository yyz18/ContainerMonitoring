FROM alpine:edge
EXPOSE 80
RUN apk add --update bash && rm -rf /var/cache/apk/*
COPY script.sh /
RUN chmod +x /script.sh
CMD ["bash", "/script.sh"]
