FROM rocker/shiny

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y libssl-dev

RUN apt-get install -y libxml2-dev

RUN apt-get install -y libmariadbclient-dev

WORKDIR /home

RUN chmod o+w /usr/local/lib/R/site-library

RUN chmod o+w /srv/shiny-server

COPY Source/install_pkg /home

RUN apt-get install -y libv8-3.14-dev

RUN Rscript 00.R

RUN Rscript 01.R

RUN apt-get update -y

