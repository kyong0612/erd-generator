.PHONY: init
init:
	@echo "create tbls config file..."
	@cp sample.tbls.yml .tbls.yml
	@echo "create tbls config file...done"
	@echo "create tbls schema file..."
	@make generate.tbls.schema
	@echo "create tbls schema file...done"

.PHONY: generate.tbls
generate.tbls.schema:
	@go tool github.com/k1LoW/tbls doc

.PHONY: generate.erd
generate.erd:
	@npx @liam-hq/cli erd build --format tbls --input dbdoc/schema.json

.PHONY: run.erd-server
run.erd-server:
	@echo "Starting ERD server..."
	@npx http-server dist
	