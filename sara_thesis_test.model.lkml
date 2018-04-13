connection: "thesis_jiro_global_terrorism"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: sara_thesis_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sara_thesis_test_default_datagroup

# NOTE: please see https://looker.com/docs/r/sql/bigquery?version=5.12
# NOTE: for BigQuery specific considerations

explore: global_terrorism {}
