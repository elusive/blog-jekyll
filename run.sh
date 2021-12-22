#!/bin/bash
# simply executes a docker run command so I do not have to remember it

docker.exe run -p 8080:4000 -v /home/jogi/src/elusive.github.io:/site jekyll-server