FROM r-base:4.4.2
## Base image <https://hub.docker.com/_/r-base?tab=tags&page=1&ordering=last_updated>

## Install dependencies for `rJava`.
## Note: `liblzma-dev` and `libbz2-dev` are additional system
## dependencies for compiling `rJava`.
## See <https://stackoverflow.com/a/62001619>.
RUN apt-get -y update && apt-get install -y \
    ## `libpq-dev` for `RPostgres`:
    libpq-dev \
    ## `libxml2-dev` for `xml2`:
    libxml2-dev \
    default-jdk \
    r-cran-rjava \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

## Create directories:
RUN mkdir -p /mount/R

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