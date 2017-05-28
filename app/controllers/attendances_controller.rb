# coding: utf-8
class AttendancesController < ApplicationController
  def regist
    regist_time = Record.new()
    regist_time.registered_date = params[:time_now]
    regist_time.registered_division = params[:division_id]
    regist_time.save
  end
end
