FROM rocker/shiny

RUN apt-get update && apt-get install -y \
    libcurl4-gnutils-dev \
    libssl-dev

RUN R -e 'install.packages(c(\
              "shiny", \
              "shinydashboard", \
              "ggplot2" \
            ), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
          )'

COPY ./* /srv/shiny-server

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]