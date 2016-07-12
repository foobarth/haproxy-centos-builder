FROM centos:7

RUN yum install -y rpmdevtools pcre-devel rpmdev-setuptree openssl-devel bash curl \
 && yum -y groupinstall 'Development Tools'
