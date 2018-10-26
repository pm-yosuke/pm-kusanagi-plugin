FROM centos:7.5.1804
LABEL maintainer="Yosuke Nakatsukasa <yosuke_nakatsukasa@pressman.ne.jp>"

COPY files/prime-strategy.repo /etc/yum.repos.d/
RUN yum install -y epel-release && \
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi && \
    yum update -y --enablerepo=epel,remi,remi-php56 && \
    yum install -y --enablerepo=epel,remi,remi-php56 kusanagi
VOLUME /mu-plugins
COPY files/script.sh /
RUN chmod a+x /script.sh
ENTRYPOINT ["/script.sh"]
