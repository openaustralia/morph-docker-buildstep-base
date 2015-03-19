# Morph Docker Buildstep Base

The Dockerfile in this repo creates the base docker image which is used for openaustralia/buildstep.

It's basically something very similar to the cedar platform on Heroku with a few extra libraries
installed that we want to use.

So, if you need an extra library installed in Morph.io this is the likely repo that you will need
to modify.

After updating this repo
1. Push to github. This will trigger an automatic build on the Docker Hub and should (fingers crossed)
also automatically trigger a build of [openaustralia/buildstep](https://registry.hub.docker.com/u/openaustralia/buildstep/)
2. Wait until the build of openaustralia/buildstep is complete
3. Either deploy morph.io to force latest images to be downloaded or ssh to morph.io and `docker pull openaustralia/buildstep`
