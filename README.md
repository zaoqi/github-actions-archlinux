# github-actions-archlinux
Install Archlinux on Github Actions.

## Example

[.github/workflows/ci.yml](.github/workflows/ci.yml)
```yaml
name: CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@v1
    - name: Install Archlinux
      run: curl -L https://github.com/zaoqi/github-actions-archlinux/raw/master/install.sh | sh
    - name: Docker hello-world
      run: |
        sudo pacman --noconfirm -Syu docker
        sudo systemctl start docker
        docker run --rm hello-world
```

## Image

* [Dockerfile](Dockerfile)
* [Docker Hub](https://hub.docker.com/r/zaoqi/github-actions-archlinux)
