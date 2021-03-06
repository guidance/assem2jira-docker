# Assembla >> JIRA Migration Tool Docker Wrapper

## Prerequisites
1. Docker Installed
1. Read through [migration docs](https://github.com/guidance/assembla-to-jira-migration/blob/master/README.md)

## Setup

1. Clone Repo `git clone https://github.com/guidance/assem2jira-docker.git /data/projects/[project-name]`
1. cd /data/projects/[project-name]
1. Copy `docker-compose.yml.sample` to `docker-compose.yml`
1. Set Environment Variables with needed keys and project names
1. `docker-compose up`

## Run Migration Commands
1. Get into the running tool container `docker exec -it assem2jira_tool_1 bash`
1. from this prompt, you can run the commands from the migration docs (e.g. `ruby 01-assembla_export_space.rb`)

## Actions taken

Ruby wasn't available, so I had to run the following commands:

	ruby -v
	source /usr/local/rvm/scripts/rvm
	rvm install 2.4.1
	gem install bundler
	bundle install

Had to adjust the environment variables, if necessary

	nano .env

	# Some Noteworthy ENV Variables 
	JIRA_ISSUE_DEFAULT_TYPE=story
	JIRA_API_STATUSES=New:To Do,In Progress,Blocked,Testable,Ready for Acceptance,In Acceptance Testing,Ready for Deploy,Done,Invalid:Done
	ASSEMBLA_TICKET_REPORT=4
	# 0: All Tickets, 1: Active Tickets, order by milestone, 4: Closed Tickets, order by milestone, personal reports start with "u"


Then ran the following commands

	ruby 01-assembla_export_space.rb
	ruby 02-assembla_export_tickets.rb comments
	ruby 02-assembla_export_tickets.rb attachments
	ruby 02-assembla_export_tickets.rb tags
	ruby 02-assembla_export_tickets.rb associations
	ruby 03-assembla_report_users.rb
	ruby 04-assembla_report_tickets.rb
	# ruby 05-jira_create_project.rb << We Don't need this, because our JIRA Project is already there
	ruby 06-jira_create_issuelink_types.rb
	ruby 07-jira_get_info.rb
	ruby 08-jira_import_users.rb
	ruby 09-jira_download_attachments.rb

	# Get some screen IDs from JIRA
	ruby 10-jira_create_custom_fields.rb 10802 10801
	ruby 11-jira_import_tickets.rb
	ruby 12-jira_update_ticket_links.rb
	ruby 13-jira_import_comments.rb
	ruby 14-jira_import_attachments.rb
	ruby 15-jira_update_status.rb
    ruby 16-jira_update_association.rb
	ruby 17-jira_update_watchers.rb
	ruby 19-jira_update_epics.rb
	
## Issues

1. Attachments from Assembla are broken files
1. Users are created straight from Assembla, so if JIRA users exist, you will have dups
