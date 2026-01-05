FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache rsync bash

# Simple entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]