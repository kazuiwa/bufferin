#coding: utf-8
class Record < ApplicationRecord

  #---------------------------------
  # バリデーション
  #---------------------------------
  validate :check_start_time

  # 出勤時間
  def check_start_time
    # 出勤時間重複チェック
    target_day_start = Time.new(start_time.strftime('%Y'), start_time.strftime('%m'), start_time.strftime('%d'))
    target_day_end = target_day_start.tomorrow
    registered = Record.where("start_time between ? and ?", target_day_start, target_day_end)
    if registered.present?
      errors.add(:start_time, "既に登録されています。")
    end
  end

  #---------------------------------
  # クラスメソッド
  #---------------------------------
  class << self

  end
end
