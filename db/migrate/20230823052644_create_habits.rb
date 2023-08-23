class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.boolean :done_today
      t.integer :hot_streak
      t.integer :hot_record
      t.integer :cold_streak
      t.date :date_last_done

      t.timestamps
    end
  end
end
