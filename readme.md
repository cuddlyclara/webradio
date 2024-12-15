# Simple webradio with MPD

This Docker image sets up a simple HTTP webradio powered by MPD (Music Player Daemon). It automatically plays all music files in the `./media` folder in random order.

## Docker Compose Example

To get started quickly, you can use the following `docker-compose.yml` configuration:

```yaml
services:
  mpd:
    image: cuddlyclara/webradio:latest
    container_name: webradio
    ports:
      - 0.0.0.0:8000:8000  # Webradio HTTP Port
      - 127.0.0.1:6600:6600  # MPD Control Port (optional)
    volumes:
      - ./media:/media:ro  # Mount your local music directory
    restart: unless-stopped
```

## Configuration Details

- **Webradio Port (8000)**: Exposes the HTTP web interface to listen to your music.
- **MPD Control Port (6600)**: Exposes the MPD control interface for clients that support it. This port is optional and can be omitted if you don't need MPD control access.
- **Volume Mount**: The `./media` folder is mounted to the container as a read-only (`ro`) volume, containing the music files to be played.
  
## Customization with Reverse Proxy

You can also configure the webradio to only expose the port on `127.0.0.1` and use a reverse proxy for more advanced setups, such as enabling different paths or adding TLS support.

[Docker Hub](https://hub.docker.com/r/cuddlyclara/webradio)