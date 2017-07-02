# coding: utf-8
class AttendancesController < ApplicationController
  before_action :set_record, only: [:edit, :update]
  def new
    @record = Record.new_with_default_value
  end

  def create
    @record = Record.create_with_regist_value(record_params)
    if @record.save
      redirect_to new_attendance_path, notice: '登録が完了しました。'
    else
      render "new"
    end
  end

  def edit
    @record.set_edit_value
  end

  def update
    @record.assign_attributes(record_params)
    @record.update_with_regist_value
    if @record.save
      redirect_to list_path(@record.year_month), :notice => '更新が完了しました。'
    else
      render "edit"
    end
  end

  def list
    @records = Record.by_yyyymm(params[:yyyymm])
  end

  private
  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(
        :start_datetime
    )
  end
end
