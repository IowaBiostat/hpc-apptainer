FROM ubuntu:22.04
MAINTAINER Grant Brown "grant-brown@uiowa.edu"

ENV DEBIAN_FRONTEND noninteractive
# Install some basic software
RUN apt-get clean
RUN apt-get update -y && \
 apt-get install -y apt-utils && \
 apt-get upgrade -y && \
 apt-get install -y git && \
 apt-get install -y vim && \
 apt-get install -y unzip && \
 apt-get install -y unixodbc && \
 apt-get install -y unixodbc-dev && \
 apt-get install -y libaio-dev && \
 apt-get install -y libcurl4 && \
 apt-get install -y libcurl4-openssl-dev && \
 apt-get install -y libssl-dev && \
 apt-get install -y libxml2-dev && \
 apt-get install -y wget && \
 apt-get install -y pandoc

RUN apt-get install software-properties-common -y

# Get the latest version of R (default r-base is usually a few versions old)
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
 add-apt-repository 'deb https://cran.rstudio.com/bin/linux/ubuntu jammy-cran40/' && \
 apt-get update -y && \
 apt-get install -y r-base && \
 apt-get install -y r-base-dev && \
 apt-get install build-essential

# R setup
COPY ./scripts/setup.R /root/setup.R
RUN cd /root && R CMD BATCH setup.R

# Command (default)
CMD /bin/bash












