# This docker file contains build environment
FROM opensuse:42.3
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

RUN   zypper -n in -n kernel-default-4.4.120-45.1