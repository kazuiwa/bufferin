#coding: utf-8
class Record < ApplicationRecord

  #---------------------------------
  # バリデーション
  #---------------------------------
  validate :check_start_datetime

  # 出勤時間
  def check_start_datetime
    # 出勤時間重複チェック
    target_day_start = Time.new(start_datetime.strftime('%Y'), start_datetime.strftime('%m'), start_datetime.strftime('%d'))
    target_day_end = target_day_start.tomorrow
    registered = Record.where("start_datetime between ? and ?", target_day_start, target_day_end)
    if registered.present?
      errors.add(:start_datetime, "既に登録されています。")
    end
  end

  #---------------------------------
  # インスタンスメソッド
  #---------------------------------
  # インスタンス変数にパラメータをセット
  def set_record_params
    # 年月カラムの値をセット
    self.year_month = self.start_datetime.strftime('%Y%m').to_i
  end

  #---------------------------------
  # クラスメソッド
  #---------------------------------
  class << self

  end
end
