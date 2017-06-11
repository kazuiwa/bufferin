# coding: utf-8
class AttendancesController < ApplicationController
  def new
    @record = Record.new
  end
  def create
    @record = Record.new(record_params)
    @record.set_record_params
    if @record.valid?
      @record.save!(validate:false)
      redirect_to new_attendance_path, notice: '登録が完了しました。'
    else
      render "new"
    end
  end
  def show
    @records = Record.where("year_month = ?", params[:id])
  end
  private
  def record_params
    params.require(:record).permit(
        :start_datetime
    )
  end
end
