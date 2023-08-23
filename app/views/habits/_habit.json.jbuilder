json.extract! habit, :id, :name, :done_today, :hot_streak, :hot_record, :cold_streak, :date_last_done, :created_at, :updated_at
json.url habit_url(habit, format: :json)
