class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_habit, only: %i[ edit update destroy ]

  # GET /habits or /habits.json
  def index
    if params[:sort_by]
      @habits = sort_habits
    else
      @habits = Habit.all.order(created_at: :desc)
    end
    @habit = Habit.new
    @sorted_by = params[:sort_by]
  end

  # GET /habits/1/edit
  def edit
  end

  # POST /habits or /habits.json
  def create
    @habit = current_user.habits.build(habit_params)

    if @habit.save
      redirect_to habit_url(@habit), notice: "#{@habit.name} was successfully created."
    else
      if @habit.errors.any?
        @habit.errors.each do |error|
          flash[:alert] = error.full_message
        end
      end
      render partial: "habits/new", locals: { habit: @habit }, status: :unprocessable_entity
    end
\
  end

  # PATCH/PUT /habits/1 or /habits/1.json
  def update
    respond_to do |format|
      sort_by = params[:habit].delete(:sort_by)
      if @habit.update(habit_params)
        @habit.done_today ? @habit.mark_done : @habit.unmark_done
        @habit.save!
        redirect_to habits_path(sorted_by: sort_by), notice: "#{@habit.name} was successfully updated."
      else
        if @habit.errors.any?
          @habit.errors.each do |error|
            flash[:alert] = error.full_message
          end
        end
        render :index, status: :unprocessable_entity
      end
    end
  end

  # DELETE /habits/1 or /habits/1.json
  def destroy
    @habit.destroy
    redirect_to habits_url, notice: "#{@habit.name} was deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_habit
    @habit = Habit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def habit_params
    params.fetch(:habit, {}).permit(:name, :done_today, :hot_streak, :hot_record, :cold_streak, :date_last_done, :sort_by)
  end

  def sort_habits
    case params[:sort_by]
    when "created" then @habits = Habit.all.order(created_at: :desc)
    when "streak" then @habits = Habit.all.order(Arel.sql('CASE WHEN hot_streak > 0 THEN hot_streak ELSE 0 END DESC, cold_streak ASC'))
    when "record" then @habits = Habit.all.order(hot_record: :desc)
    when "done" then @habits = Habit.all.order(Arel.sql('CASE WHEN date_last_done IS NULL THEN 1 ELSE 0 END, date_last_done DESC'))
    end
  end
end
