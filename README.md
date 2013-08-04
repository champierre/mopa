MoPA
====

MoPA = Museum of Public Art
A public art GIS.

## Setup for development
```bash
$ cp config/database.yml.example config/database.yml
$ cp config/gmap_key.yml.example config/gmap_key.yml
$ vim config/gmap_key.yml  # set your GoogleMaps API key
$ cp config/s3.yml.example config/s3.yml
$ vim config/s3.yml  # set your S3 ID and access key
$ rake db:migrate
```

## Start development server
```bash
$ rails server
```

