#!/bin/bash

echo "Assembla to JIRA Migration Container setup is running"

git clone https://github.com/guidance/assembla-to-jira-migration.git /tool/assembla-to-jira

source /usr/local/rvm/scripts/rvm
rvm install 2.4.1
gem install bundler
bundle install

echo " "
echo " "
echo " "

echo "Needed files are now in place"

echo " "

echo "The container will be alive until you kill it"

cp .env.example .env

while true; do sleep 84600; done