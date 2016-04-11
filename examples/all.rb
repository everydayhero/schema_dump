require "schema_dump"

database_url = "postgres://localhost/payments_development"

SchemaDump::Dump.call(
  database_url: database_url,
)
