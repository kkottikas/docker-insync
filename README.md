# hub.docker.com/r/kkottikas/docker-insync

[![GitHub release](https://img.shields.io/github/v/tag/kkottikas/docker-insync?style=flat-square)](https://github.com/kkottikas/docker-insync/releases/latest)
[![Build Status](https://img.shields.io/github/workflow/status/kkottikas/docker-insync/build?style=flat-square)](https://github.com/kkottikas/docker-insync/actions?query=workflow%3Abuild)
[![Docker Stars](https://img.shields.io/docker/stars/kkottikas/docker-insync.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/kkottikas/docker-insync/)
[![Docker Pulls](https://img.shields.io/docker/pulls/kkottikas/docker-insync.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/kkottikas/docker-insync/)

## About

This will build a Docker image for [insync](https://insynchq.org). A tool for backing up Google Drive.
It contains the insync-headless v3.2.6.10745 (buster, amd64)

* Supports Single account
## Maintainer

- [Konstantinos Kottikas](https://github.com/kkottikas)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Architecture](#multi-architecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
  - [Networking](#networking)
  - [Restart Policy](#Restart-Policy)
- [Maintenance](#maintenance)
  - [Selectively Syncing Files](#selectively-syncing-files)
  - [Ignoring Files/Folders](#ignoring-filesfolders)
  - [Shell Access](#shell-access)
- [Contributions](#contributions)
- [License](#license)
- [References](#references)

## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`
### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/kkottikas/docker-insync) and is the recommended method of installation.

```bash
docker pull kkottikas/docker-insync:(imagetag)
```

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Version | Container OS | Tag       |
| ------- | ------------ | --------- |
| latest  | Ubuntu       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported.

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
- Make [networking ports](#networking) available for public access if necessary

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory                | Description                                                          |
| ------------------------ | -------------------------------------------------------------------- |
| `/data`                  | Backup and Configuration Directory                                   |

### Environment Variables

#### Base Images used

This image relies on an [Ubuntu Linux (Jammy)](https://hub.docker.com/_/ubuntu) base image.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://hub.docker.com/_/ubuntu) | Ubuntu Linux (Jammy)					  |


| Parameter           | Description                                                                                 | Default |
| ------------------- | ------------------------------------------------------------------------------------------- | ------- |
| `INSYNC_USERNAME`  | Primary Your GDrive Username e.g. `user@gmail.com`                                           |         |
| `INSYNC_AUTH_CODE` | Primary Authorization Code provided by Google e.g. `4/0ARtssJoyaGC4Y9k........`              |         |
| `INSYNC_DOWNLOAD`  | Primary How to download files `LINK` (.gdoc), `MS_OFFICE` (.docx), `OPEN_DOCUMENT` (.odt)    | |
| `INSYNC_CLOUD_PROVIDER`  | Primary Your cloud provider Google Drive (gd) / OneDrive (od) / Dropbox (dx). Note: only (gd) is tested but the rest should also work.        |   |

Authorization Code provided by Google can be claimed [here](https://www.insynchq.com/auth?cloud=gd). A license shall be bought from  [insync](https://insynchq.com) before the acquisition of the authorization code.

Authorization Code provided by OneDrive can be claimed [here](https://www.insynchq.com/auth?cloud=od).

### Networking

No ports are exposed.

### Restart Policy

Always

## Maintenance
Inside the image are tools to perform modification on how the image runs.

### Selectively Syncing Files
* Enter the container and execute `insync-headless selective-sync` and use the Ncurses Interface

### Ignoring Files/Folders
* Enter the container and execute `insync-headless selective-sync` and use the Ncurses Interface


### Shell Access
For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is) bash
```
Insync 3 Headless full list of commands: [Insync 3 Headless: Getting started](https://help.insynchq.com/en/articles/4257855-insync-3-headless-getting-started).

## Contributions
Welcomed. Please fork the repository and submit a [pull request](../../pulls) for any bug fixes, features or additions you propose to be included in the image. If it does not impact my intended usage case, it will be merged into the tree, tagged as a release and credit to the contributor in the [CHANGELOG](CHANGELOG).

## License
MIT. See [LICENSE](LICENSE) for more details.


## References

* https://insync.com


