class AddDefaultsToHabit < ActiveRecord::Migration[7.0]
  def change
    change_column_default :habits, :done_today, false
    change_column_default :habits, :hot_streak, 0
    change_column_default :habits, :hot_record, 0
    change_column_default :habits, :cold_streak, 0
    change_column_default :habits, :date_last_done, nil
  end
end
