#Worker
#docker build -t ffxxe/hadoop-worker:hadoop3.1.2 .
FROM centos:centos7.7.1908
LABEL maintainer="worker"

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

RUN mkdir -p /opt/mount{1,2}/datanode-dir \
&& mkdir -p /opt/mount{1,2}/nodemanager-local-dir \
&& mkdir -p /opt/mount{1,2}/nodemanager-log-dir

VOLUME /opt/mount1/datanode-dir
VOLUME /opt/mount2/datanode-dir
VOLUME /opt/mount1/nodemanager-local-dir
VOLUME /opt/mount2/nodemanager-local-dir
VOLUME /opt/mount1/nodemanager-log-dir
VOLUME /opt/mount2/nodemanager-log-dir

EXPOSE 9864 8042

CMD ["/usr/local/hadoop/current/etc/hadoop/work.sh"]
