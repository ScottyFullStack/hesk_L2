FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /public_html

COPY . .

EXPOSE 8000