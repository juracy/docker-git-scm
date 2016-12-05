# docker-git-scm

Container for [Git][1]

## Usage

    $ docker run -it juracy/docker-git-scm

## Manage a git repository with specific git version

    $ docker run -it -v $(pwd):/work juracy/docker-git-scm:2.11 git status

[1]:https://www.git-scm.com
