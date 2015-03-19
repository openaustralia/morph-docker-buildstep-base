# progrium/cedarish:cedar14 was segfaulting on ruby for some reason.
# So, using latest version as the base instead
FROM progrium/cedarish
MAINTAINER Matthew Landauer <matthew@oaf.org.au>

RUN mkdir /app
VOLUME /data
RUN ln -s /data/data.sqlite /app/data.sqlite
# Get rid of annoying error message "stdin: is not a tty"
ADD profile /root/.profile

# poppler-utils has a more recent pdftohtml than the pdftohtml package
# pdftohtml is needed by the python scraperwiki library
# libffi-dev needed by python cffi
# time is needed directly by morph.io for scraper run measurements
RUN apt-get install -y time libblas-dev liblapack-dev gfortran swig protobuf-compiler libprotobuf-dev libsqlite3-dev poppler-utils libffi-dev phantomjs
