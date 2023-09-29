# Joplin Sync

A self-hosted Nginx instance with WebDAV module for Joplin notes syncronization.
Done over TLS with enabled Basic Auth. Also implemented git sync as a backup mechanism.

If use plan to use it, please make sure your notes are encrypted in Joplin with
password at least and make sure you use this project only for sync.

## How to use

1. Clone this repository:
```bash
git clone https://github.com/silentz/joplinsync
```

2. Run `make` to init ssh-keys, nginx certificates and webdav credentials:
```bash
make
```

3. Go into `data/` directory and setup your upstreams (could be multiple):
```bash
cd data/
git remote add upstream_01 git@github.com:silentz/mirror_01.git
git remote add upstream_02 git@github.com:silentz/mirror_02.git
...
git remote add upstream_XX git@github.com:silentz/mirror_XX.git
```

4. Run service:
```bash
docker-compose up
```
