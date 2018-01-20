FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y curl git nano

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
	cd /tmp && \curl -sSL https://get.rvm.io -o rvm.sh && \
	cat /tmp/rvm.sh | bash -s stable

WORKDIR /tool/assembla-to-jira

RUN git clone https://github.com/guidance/assembla-to-jira-migration.git /tool/assembla-to-jira

RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm && rvm install 2.4.1 && gem install bundler && bundle install"

COPY tool.sh /tool/run.sh
RUN chmod +x /tool/run.sh

COPY environment.txt /tool/assembla-to-jira/.env

ENTRYPOINT /tool/run.sh