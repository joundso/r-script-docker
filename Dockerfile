FROM rocker/r-base:4.1.0
## Base image https://hub.docker.com/r/rocker/r-base/tags?page=1&ordering=last_updated

## Create directories:
RUN mkdir -p /mount/data
RUN mkdir -p /mount/R
RUN mkdir -p /mount/out

## Install dependencies:
COPY ./R/install_packages.R /mount/R/install_packages.R
RUN Rscript /mount/R/install_packages.R

## Copy all other R files - This also overwrites the install_packages.R
## file from above but speeds up the whole process if there are only
## changes in code and not in the packages. Otherwise all packages need
## be re-installed even if only the code changed):
COPY ./R /mount/R

WORKDIR /mount/R
CMD ["Rscript", "script.R"]