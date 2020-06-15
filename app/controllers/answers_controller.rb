class AnswersController < ApplicationController
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @answer = @schedule.answer.build(answer_params)

    if @answer.save
      redirect_to schedule_path(@answer.schedule), notice: '出欠が登録されました。'
    else
      # redirect_to schedule_path(@answer.schedule),
      #             notice: '名前が記入されていません。'
      @schedules = Schedule.uketsukechu
      render 'schedules/show'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to schedule_path(@answer.schedule), notice: '登録が削除されました。'
  end

  private

  def answer_params
    params.require(:answer).permit(:schedule_id, :name, :reason, :comment)
  end
end
