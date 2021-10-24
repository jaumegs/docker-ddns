# jaumegs/docker-ddns

Docker image to update a dynamic DNS record of a domain registered at
[GoDaddy](https://godaddy.com/).

## Installation

```sh
git clone https://github.com/jaumegs/docker-ddns.git
cd docker-ddns
docker build --no-cache --pull -t jaumegs/docker-ddns:latest .
```

## Usage

```sh
docker run -d \
    --name=ddns-example.com \
    -e KEY='API KEY' \
    -e SECRET='API SECRET' \
    -e DOMAIN=example.com \
    jaumegs/docker-ddns
```

## Parameters

| Parameter | Description |
| --- | --- |
| `-e KEY=<api-key>` | GoDaddy API key |
| `-e SECRET=<api-secret>` | GoDaddy API secret |
| `-e DOMAIN=<domain>` | Domain name to update |
| `-e TYPE=A` | Type of the record to update |
| `-e NAME=@` | Name of the record to update |
| `-e TTL=600` | Time to live in seconds of the record to update |
| `-e DELAY=0` | Script execution start delay |
| `-e FREQUENCY=600` | Update frequency in seconds |
| `-e TIMEOUT=30` | HTTP requests timeout in seconds |

## License

Copyright © 2021 [Jaume Garí Siquier](https://u2200.net/).
Released under the [ISC license](https://choosealicense.com/licenses/isc/).
