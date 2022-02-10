# shiny-verse is the shiny docker image with tidyverse and devtools included.
# more info on https://hub.docker.com/r/rocker/shiny-verse

FROM rocker/shiny-verse:latest

RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev
    

# install R packages required 
# (change it dependeing on the packages you need)
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"

COPY ./ /srv/shiny-server

# 3838 is default shiny server port
EXPOSE 3838

CMD ["/usr/bin/shiny-server"]
