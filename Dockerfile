FROM ruby:2-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/elindsey/jekyll-action"

LABEL "com.github.actions.name"="Jekyll Action"
LABEL "com.github.actions.description"="A GitHub Action to build and publish Jekyll sites to GitHub Pages"
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="blue"

#ENV BUNDLER_VERSION 1.17.3
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git

COPY LICENSE entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
