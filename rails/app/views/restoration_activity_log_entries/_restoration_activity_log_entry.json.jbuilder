json.extract! restoration_activity_log_entry,
              :id,
              :cleaned,
              :percent_filled,
              :bleached_corals,
              :dead_corals,
              :dive_id,
              :nursery_table_id,
              :created_at,
              :updated_at

json.url restoration_activity_log_entry_url(restoration_activity_log_entry, format: :json)
