class AddPreviousDateLastDoneToHabit < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :previous_date_last_done, :date, default: nil
  end
end
