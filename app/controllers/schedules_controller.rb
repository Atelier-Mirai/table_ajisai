class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def show
    @schedules = Schedule.uketsukechu
    @answer = @schedule.answer.build
  end

  def new
    @schedules = Schedule.all
    @schedule  = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to new_schedule_path, notice: 'スケジュールが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to new_schedule_path, notice: 'スケジュールが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to new_schedule_path, notice: 'スケジュールが削除されました。'
  end

  private

  def set_schedule
    # @schedule = Schedule.find(params[:id])
    @schedule = if params[:id].blank?
                  Schedule.uketsukechu.first
                else
                  Schedule.find(params[:id])
                end
  end

  def schedule_params
    params.require(:schedule).permit(:ymd, :start, :end, :place, :addcomment)
  end
end
