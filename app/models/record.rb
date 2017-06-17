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
    if registered.present? && id != registered.first.id
      errors.add(:start_datetime, "既に登録されています。")
    end
  end

  #---------------------------------
  # インスタンスメソッド
  #---------------------------------
  # 初期表示時のデフォルト値をセットしたインスタンスを生成
  def set_default_value
    self.year_month = Time.now.strftime('%Y%m').to_i
  end

  #---------------------------------
  # クラスメソッド
  #---------------------------------
  class << self
    # デフォルト値がセットされたインスタンス変数を生成
    def new_with_default_value
      record = self.new
      record.set_default_value
      record
    end

    # 登録する値をセットしたインスタンスを生成
    def new_with_regist_value(params)
      record = self.new(params)
      # 入力フォームにない年月カラムの値をセット
      record.year_month = record.start_datetime.strftime('%Y%m').to_i
      record
    end
  end
end
