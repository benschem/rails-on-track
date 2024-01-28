class AddPreviousColdStreakToHabit < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :previous_cold_streak, :integer, default: 0
  end
end
