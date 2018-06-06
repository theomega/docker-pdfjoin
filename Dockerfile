FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends texlive-extra-utils texlive-latex-recommended
RUN useradd docker \
  && mkdir /home/docker \
&& chown docker:docker /home/docker

USER docker
WORKDIR /home/docker
ENTRYPOINT ["/usr/bin/pdfjoin"]
