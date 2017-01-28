FROM ubuntu:16.04
MAINTAINER Osipion

RUN apt-get update && \
    apt-get install -y haskell-platform

RUN mkdir /app

ADD dist/build/httptest/httptest /app/httptest

EXPOSE 3021

CMD ["/app/httptest", "-p", "3021"]