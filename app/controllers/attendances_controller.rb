# coding: utf-8
class AttendancesController < ApplicationController
  def new
    @record = Record.new_with_default_value
  end
  def create
    @record = Record.new_with_regist_value(record_params)
    if @record.save
      redirect_to new_attendance_path, notice: '登録が完了しました。'
    else
      render "new"
    end
  end
  def list
    @records = Record.where("year_month = ?", params[:yyyymm])
  end
  private
  def record_params
    params.require(:record).permit(
        :start_datetime
    )
  end
end
