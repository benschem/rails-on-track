class Habit < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  belongs_to :user

  def mark_done
    self.done_today = true
    self.hot_streak += 1
    self.hot_record +=1 if self.hot_streak > self.hot_record
    self.previous_cold_streak = cold_streak
    self.cold_streak = 0
    self.previous_date_last_done = date_last_done
    self.date_last_done = Date.today
  end

  def unmark_done
    self.done_today = false
    self.hot_record -=1 if self.hot_streak == self.hot_record
    self.hot_streak -= 1
    self.cold_streak = self.previous_cold_streak
    self.date_last_done = self.previous_date_last_done
  end

  def last_done
    if self.date_last_done.nil?
      last_done = 'Never'
    else
      days_ago = (Date.today - date_last_done).to_i
      case days_ago
      when 0 then last_done = "Today"
      when 1 then last_done = "Yesterday"
      else
        last_done = "#{days_ago} days ago"
      end
    end
    last_done
  end
end
