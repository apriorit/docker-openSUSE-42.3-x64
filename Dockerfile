# This docker file contains build environment
FROM opensuse:42.3
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

RUN zypper -n update && zypper clean --all