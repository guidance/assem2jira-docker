#!/bin/bash

echo "Assembla to JIRA Migration Container setup is running"

git clone https://github.com/guidance/assembla-to-jira-migration.git /tool/assembla-to-jira

source /usr/local/rvm/scripts/rvm
rvm install 2.4.1
gem install bundler
bundle install

echo "\n\n\n"

echo "Needed files are now in place\n"

echo "The container will be alive until you kill it"

while true; do sleep 84600; done