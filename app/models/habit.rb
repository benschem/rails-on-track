class Habit < ApplicationRecord
  def mark_done
    done_today = true
    hot_streak += 1
    hot_record +=1 if hot_streak > hot_record
    previous_cold_streak = cold_streak
    cold_streak = 0
    previous_date_last_done = date_last_done
    date_last_done = Date.today
  end

  def unmark_done
    done_today = false
    hot_record -=1 if hot_streak == hot_record
    hot_streak -= 1
    cold_streak = previous_cold_streak
    date_last_done = previous_date_last_done
  end

  def last_done
    if date_last_done.nil?
      last_done = 'Never'
    else
      days_ago = (Date.today - date_last_done).to_i
      last_done = days_ago == 1 ? "#{days_ago} day ago" : "#{days_ago} days ago"
    end
    last_done
  end
end
