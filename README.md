# Morph Docker Buildstep Base

The Dockerfile in this repo creates the base docker image which is used for [openaustralia/buildstep](https://hub.docker.com/r/openaustralia/buildstep/).

It's basically something very similar to the cedar platform on Heroku with a few extra libraries
installed that we want to use.

So, if you need an extra library installed in Morph.io this is the likely repo that you will need
to modify.

After updating this repo:

1. Push to github. This will trigger an automatic build on the Docker Hub and should (fingers crossed)
also automatically trigger a build of [openaustralia/buildstep](https://hub.docker.com/r/openaustralia/buildstep/)
2. Wait until the build of openaustralia/buildstep is complete
3. Either deploy morph.io to force latest images to be downloaded or ssh to morph.io and `docker pull openaustralia/buildstep`

## Updating the mitmproxy CA certificate

This repository also contains the CA certificate that gets installed into morph.io containers so that the transparent mitmproxy works. It expires every few years and needs to be updated, to do this:

1. Before you start you probably want to disable mitmproxy on the server. Run `iptables-morph-remove` on the server to do this
2. Install and run `mitmproxy` on your machine, this will create a set of certificates in `~/.mitmproxy`
3. Check the expiry on `mitmproxy-ca-cert.pem` in that directory - it should be a few years off
4. Overwrite the `mitmproxy-ca-cert.pem` file in this repository with the one from your machine
5. Carry out the steps above "After updating this repository"
6. Replace the certificates in the main [morph.io repository](https://github.com/openaustralia/morph) by copying all 5 from `~/.mitmproxy` to that repository. Push your changes to GitHub and deploy morph.io
7. Re-enable the mitmproxy on the server by running `iptables-morph-add`
