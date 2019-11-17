FROM ruby:2-slim

LABEL repository="https://github.com/elindsey/jekyll-action"

#ENV BUNDLER_VERSION 1.17.3
RUN apt-get update && \
    apt-get install -yq \
        build-essential \
        git

COPY LICENSE entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
