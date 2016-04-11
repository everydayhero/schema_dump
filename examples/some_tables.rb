require "schema_dump"

database_url = "postgres://localhost/payments_development"

SchemaDump::Dump.call(
  database_url: database_url,
  tables: %w(
    cobra_projections_process_manager_states
    cobra_projections_read_model_states
    cobra_projections_process_manager_dependencies
  )
)
