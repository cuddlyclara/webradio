FROM alpine:3

COPY mpd.conf /etc/mpd.conf
COPY start.sh /start.sh

RUN set -ex && \
    apk add --no-cache mpd mpc && \
    mkdir -p /var/lib/mpd/playlists && \
    touch /var/lib/mpd/database \
        /var/lib/mpd/mpd.pid \
        /var/lib/mpd/state \
        /var/lib/mpd/sticker.sql && \
    chown mpd:audio -R /var/lib/mpd && \
    chmod +x /start.sh

EXPOSE 6600 8000

CMD ["/start.sh"]