# Assembla >> JIRA Migration Tool Docker Wrapper

## Prerequisites
1. Docker Installed
1. Read through [migration docs](https://github.com/guidance/assembla-to-jira-migration/blob/master/README.md)

## Setup

1. Clone Repo
1. Copy `docker-compose.yml.sample` to `docker-compose.yml`
1. Set Environment Variables with needed keys and project names
1. `docker-compose up`

## Run Migration Commands
1. Get into the running tool container `docker exec -it assem2jira_tool_1 bash`
1. from this prompt, you can run the commands from the migration docs (e.g. `ruby 01-assembla_export_space.rb`)
