FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y curl git nano

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
	cd /tmp && \curl -sSL https://get.rvm.io -o rvm.sh && \
	cat /tmp/rvm.sh | bash -s stable

WORKDIR /tool/assembla-to-jira

COPY tool.sh /tool/run.sh
RUN chmod +x /tool/run.sh

ENTRYPOINT /tool/run.sh