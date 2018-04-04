# This docker file contains build environment
FROM opensuse:42.3
MAINTAINER krytin <krytin.vitaly@apriorit.com>

RUN zypper -n update && zypper clean --all
RUN zypper -n install -t pattern devel_C_C++
RUN zypper -n install clang llvm-clang-devel llvm-devel cmake python-testtools python-pip wget

#install kernel headers 4.4 x64
RUN zypper -n install kernel-devel && zypper -n install kernel && ls -l /lib/modules

#install build essential for project
RUN zypper -n in gcc-c++ && wget http://nixos.org/releases/patchelf/patchelf-0.8/patchelf-0.8.tar.gz && tar xf patchelf-0.8.tar.gz && patchelf-0.8/configure && make install && rm -rf patchelf-0.8 && rm -f patchelf-0.8.tar.gz
RUN zypper -n dup
RUN zypper -n si -d qemu-kvm
RUN zypper -n install libelf-devel
RUN zypper -n install git autoconf

#gRPC
RUN git clone --recursive --branch release-0_14_1 --single-branch https://github.com/grpc/grpc
RUN cd grpc && make HAS_SYSTEM_OPENSSL_NPN=false HAS_SYSTEM_OPENSSL_ALPN=false && make install prefix=/opt/grpc \
&& cd third_party/protobuf/ && make install prefix=/opt/grpc
#*******************************************