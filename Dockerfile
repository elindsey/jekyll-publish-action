FROM ruby:2-slim

LABEL repository="https://github.com/elindsey/jekyll-publish-action"

RUN gem install bundler && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        git

COPY LICENSE entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
