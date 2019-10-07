json.extract! restoration_activity_log_entry,
              :id,
              :cleaned,
              :corals_added,
              :bleached_corals,
              :dead_corals,
              :removed_for_planting,
              :dive_id,
              :nursery_table_id,
              :created_at,
              :updated_at

json.url restoration_activity_log_entry_url(restoration_activity_log_entry, format: :json)
