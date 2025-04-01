.PHONY: all
all: generate serve

.PHONY: init
init:
	@echo "create tbls config file..."
	@cp sample.tbls.yml .tbls.yml
	@echo "create tbls config file...done"

.PHONY: generate
generate: generate.tbls.schema generate.erd

.PHONY: generate.tbls
generate.tbls.schema:
	@rm -rf dbdoc
	@go tool github.com/k1LoW/tbls doc

.PHONY: generate.erd
generate.erd:
	@npx -y @liam-hq/cli erd build --format tbls --input dbdoc/schema.json

.PHONY: serve
serve:
	@echo "Starting ERD server..."
	@npx -y http-server dist
	