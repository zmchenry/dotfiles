#!/bin/zsh
ulimit 65536
ulimit -n 1024

LOG_HOME=$QBNHOME/logs/`hostname -s`/

if [ ! -z "$QBNHOME" ]; then
  if [ ! -d /l ]; then
      echo "making required /l/ directory"
      sudo mkdir -p /l/httpd/logs/rt/tomcat
      sudo chmod -R a+rw /l/*
  fi

  echo "Backing up old logs"
  if [ ! -d $LOG_HOME/../archive ]; then
    echo "Creating log archive directory"
    mkdir -p $LOG_HOME/../archive
  fi
  tar -cvzf $LOG_HOME/../`hostname -s`.backup.$(date '+%Y%m%d').tgz $LOG_HOME
  rm -r $LOG_HOME/*
  echo "Logs have been backed up"

  
  cd ${QBNBASE}
  echo "Running qbo-clean"
  gmake qbo-clean
  
  cd ${QBNBASE}/qbo/dependencies
  echo "Installing mvn depdenencies"
  mvn -U -s ../settings.xml package
  
  cd ${QBNBASE}
  echo "Running qbo-dev-tomcat"
  gmake qbo-dev-tomcat
 
  echo "Installing tomcat on port 8009 (shutdown port 8010)"
  sh ${QBNHOME}/bin/tomcat.install --autohome --port 8009 --shutdown_port 8010
  
  cd ${QBNBASE}/qbo/schema
  echo "Updating the schema"
  sh doupdate all
  
  echo "All done!"
else
  echo "Please initialize your environment first"
fi
