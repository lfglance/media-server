# media-server

* [Jellyfin](https://jellyfin.org)
* [Sabnzbd](https://sabnzbd.org)
* [Sonarr](https://sonarr.tv)
* [Lidarr](https://lidarr.audio/)
* [Radarr](https://radarr.video/)
* [Homepage](https://homepage.dev)

Runs all my media services. Data for all the containers hits ./data/${SERVICE}.

To mount shared media, mount external disk or symlink at ./data/media.

Bring up all services and use Nginx reverse proxy at different paths. I have sample configs here: [nginx configs](./nginx)