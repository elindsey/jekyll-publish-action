Example configuration, to be placed in a repo's .github/workflows/ :

```
name: Build and Publish to Github Pages
on:
  push:
    branches:
      - master
                                                                                                                                                                                                        
jobs:
  build_and_publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        uses: elindsey/jekyll-publish-action@master
        # alternately, to use a cached docker image
        #uses: docker://elindsey/jekyll-publish-action:latest
```
