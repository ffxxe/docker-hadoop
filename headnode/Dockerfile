#Headnode
#docker build -t ffxxe/hadoop-headnode:hadoop3.1.2 .

FROM centos:centos7.7.1908
LABEL maintainer="headnode"

RUN yum install java-1.8.0-openjdk-devel-1.8.0.232.b09-0.el7_7 -y \
&& yum clean all

WORKDIR /opt/
ADD hadoop-3.1.2.tar.gz .
RUN rm -rf hadoop-3.1.2.tar.gz* \
&& mkdir -p /opt/hadoop-3.1.2/logs \
&& mkdir -p /usr/local/hadoop/ \
&& ln -s /opt/hadoop-3.1.2/ /usr/local/hadoop/current

ENV HADOOP_HOME=/usr/local/hadoop/current
WORKDIR /usr/local/hadoop/current/etc/hadoop/
COPY configs/* /usr/local/hadoop/current/etc/hadoop/

RUN mkdir -p /opt/mount{1,2}/namenode-dir \
&& $HADOOP_HOME/bin/hdfs namenode -format cluster1

VOLUME /opt/mount1/namenode-dir
VOLUME /opt/mount2/namenode-dir

EXPOSE 9870 8088

CMD ["/usr/local/hadoop/current/etc/hadoop/head.sh"]
