class PagesController < ApplicationController
  def home
    @habits = Habit.all
    @habit = Habit.new
  end
end
