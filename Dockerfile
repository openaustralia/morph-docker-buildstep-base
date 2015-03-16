# progrium/cedarish:cedar14 was segfaulting on ruby for some reason.
# So, using latest version as the base instead
FROM progrium/cedarish
MAINTAINER Matthew Landauer <matthew@oaf.org.au>

RUN mkdir /app
VOLUME /data
RUN ln -s /data/data.sqlite /app/data.sqlite

RUN apt-get install -y libblas-dev liblapack-dev gfortran swig protobuf-compiler libprotobuf-dev libsqlite3-dev time
