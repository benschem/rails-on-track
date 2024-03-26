require 'faker'

puts "Deleting all habits..."
Habit.destroy_all

puts "Creating new habits..."

100.times do
  name = Faker::Hobby.unique.activity
  created_days_ago = Faker::Number.within(range: 0..365)
  created_at = Date.today - created_days_ago.days
  done_today = Faker::Boolean.boolean(true_ratio: 0.4)
  hot_streak = done_today ? Faker::Number.within(range: 1..created_days_ago) : 0
  hot_record = Faker::Number.within(range: 1..created_days_ago)
  date_last_done = done_today ? Date.today : Faker::Date.backward(days: created_days_ago)
  cold_streak = (Date.today - date_last_done).to_i
  previous_cold_streak = hot_streak > 0 ? 0 : Faker::Number.within(range: 1..(created_days_ago - hot_streak))
  previous_date_last_done = hot_streak > 1 ? Date.yesterday : (Date.today - previous_cold_streak.days)

  habit = Habit.create(
    name: name,
    done_today: done_today,
    hot_streak: hot_streak,
    hot_record: hot_record,
    cold_streak: cold_streak,
    date_last_done: date_last_done,
    previous_cold_streak: previous_cold_streak,
    previous_date_last_done: previous_date_last_done,
    created_at: created_at
  )

  unless habit.save
    puts "Error creating habit."
    if habit.errors.any?
      habit.errors.each do |error|
        puts "#{error.full_message}"
      end
    end
  end
end

puts "Finished. Created #{Habit.all.count} habits."
