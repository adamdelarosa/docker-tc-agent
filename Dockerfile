# docker run -e TEAMCITY_SERVER=http://buildserver:8111 -dt -p 9090:9090 ariya/centos7-teamcity-agent

FROM ariya/centos7-oracle-jre7

MAINTAINER Adam Delarosa gojiradam@gmail.com

WORKDIR .

ADD setup-agent.sh /setup-agent.sh
RUN yum -y install wget unzip sudo
RUN adduser teamcity
#RUN usermod -aG docker teamcity

EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /setup-agent.sh run"

