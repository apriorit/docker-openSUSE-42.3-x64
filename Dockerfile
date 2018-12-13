# This docker file contains build environment
FROM opensuse:42.3
MAINTAINER Sergii Kusii <kusii.sergii@apriorit.com>

RUN zypper -n in -n kernel-default kernel-default-devel && \
    zypper -n in cmake make gcc-c++ libelf-devel