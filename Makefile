.PHONY: all
all: generate serve

.PHONY: init
init:
	@echo "create database config file..."
	@cp db.config.yml.example db.config.yml
	@echo "create database config file...done"

.PHONY: generate
generate: generate.schema generate.erd

.PHONY: generate.schema
generate.schema:
	@echo "Generating PostgreSQL schema dump..."
	@DB_URI=$$(awk '/db_uri:/ {print $$2}' db.config.yml) && \
	pg_dump --schema-only --file=schema.sql --file=schema.sql "$$DB_URI"
	@echo "Schema dump created: schema.sql"

.PHONY: generate.erd
generate.erd:
	@echo "Generating ERD from PostgreSQL schema..."
	@npx @liam-hq/cli erd build --format postgres --input schema.sql

.PHONY: serve
serve:
	@echo "Starting ERD server..."
	@npx serve dist/

.PHONY: clean
clean:
	@rm -rf dist schema.sql
	@echo "Cleaned up generated files"
	