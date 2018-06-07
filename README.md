docker-pdfjoin
=============

This docker container wraps the pdfjoin utility from the texlive latex
distribution. See the [man page](https://linux.die.net/man/1/pdfjoin) or
the [more extended documentation](https://helpmanual.io/help/pdfjoin/) for
commandline options.

The working directory is set to `/home/docker`, so if you mount your external
volume there, you can specify the files without an additional path. See the
examples below.

Example (simple)
----------------
Suppose you have `~/Downloads/first.pdf` and `~/Downloads/second.pdf` which you
want to join:
```
  docker run -v $HOME/Downloads:/home/docker bdominik/docker-pdfjoin first.pdf second.pdf
```

You can find the joined pdf in `~/Downloads/first_joined.pdf`

Example (advanced)
------------------
To prevent the automatic rotation and also name the output file `output.pdf` in
the `~/Downloads` folder, use this more advanced example:
```
  docker run -v $HOME/Downloads:/home/docker bdominik/docker-pdfjoin -o output.pdf --paper a4paper --rotateoversize false first.pdf second.pdf
```

Internals
---------
The image is built using the [ubuntu 18.04][https://hub.docker.com/_/ubuntu/]
image and adding several texlive packages to get pdfjoin working.
