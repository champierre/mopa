# MoPA

## What is MoPA?

MoPA stands for Museum of Public Art. This is a project which aims to archive public art all over the world on the Internet. You’ll find public art in familiar places, for example open space in front of the buildings, parks, cultural facilities and schools etc..

## How to join MoPA as a developer

MoPA is an open source project. We use Ruby on Rails, Twitter Bootstrap, and Google Maps API to build the website. If you are interested in the project and are familiar to these thechnology(or want to be familiar), please join us as a developer. You may fork the project and send us Pull Request to fix bugs you find or show us your idea to improve MoPA.

We want to release MoPA mobile OS versions, such as iOS, Android, Firefox OS, etc. We welcome you if you are interested in these projects.

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

