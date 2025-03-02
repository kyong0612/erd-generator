# ER Generator

ER Generator is a tool to visualize database schemas as Entity-Relationship Diagrams (ERDs). It uses `tbls` to extract database schema information and `@liam-hq/cli` to generate visual ERDs.

## Prerequisites

- Go
- Node.js and npm
- PostgreSQL database

## Setup

```bash
make init
```

## Usage

- generate ERD:

```bash
make generate
```

- run the web server:

```bash
make serve
```


### Configuration

Configure your database connection by editing `.tbls.yml`. The default template is provided in `sample.tbls.yml`:
