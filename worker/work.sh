#!/bin/bash
$HADOOP_HOME/bin/hdfs --daemon start datanode
$HADOOP_HOME/bin/yarn --daemon start nodemanager
tail -f /dev/null
