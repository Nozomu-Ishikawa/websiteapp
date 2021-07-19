class SchedulesController < ApplicationController

  before_action :only_user
  before_action :set_schedule, only: %i[show edit update destroy]

  def create
    @schedule = current_user.schedules.create(schedule_params)
    flash[:success] = '予定を追加しました'
    redirect_to schedules_path
  end

  def destroy
    @schedule.destroy
    flash[:success] = '予定を削除しました'
    redirect_to schedules_path
  end

  private

  def set_schedule
    @shedule = Schedule.unscoped.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_time)
  end

end
