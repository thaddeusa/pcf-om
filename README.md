# pcf-omg
Everything needed to create a docker image for managing Pivotal Cloud Foundry using the om tool.

Currently uses terraform 0.8.7

## To compile om for alpine
 - docker run -i -t -v "$PWD":/omtool golang:1.7.4-alpine sh
 - apk update
 - apk add git
 - go get github.com/rsamban/om
 - cd src/github.com/rsamban/om/
 - go build -o /omtool/om-alpine
