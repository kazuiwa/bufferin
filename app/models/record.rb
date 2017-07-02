#coding: utf-8
class Record < ApplicationRecord

  attr_accessor :year_month

  validate :check_start_datetime

  scope :by_yyyymm, ->(yyyymm){
    if yyyymm.present? && yyyymm.length == 6
      where(year: yyyymm[0,4], month: yyyymm[4,2])
    end
  }

  #---------------------------------
  # バリデーション
  #---------------------------------

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

  def set_edit_value
    self.year_month = (self.year + self.month).to_i
  end

  def update_with_regist_value
    self.year = self.start_datetime.strftime('%Y')
    self.month = self.start_datetime.strftime('%m')
    self.day = self.start_datetime.strftime('%d')
    self.year_month = self.start_datetime.strftime('%Y%m')
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
    def create_with_regist_value(params)
      record = self.new(params)
      # 入力フォームにない年月カラムの値をセット
      record.year = record.start_datetime.strftime('%Y')
      record.month = record.start_datetime.strftime('%m')
      record.day = record.start_datetime.strftime('%d')
      record.year_month = record.start_datetime.strftime('%Y%m')
      record
    end
  end
end
