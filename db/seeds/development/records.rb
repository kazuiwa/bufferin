# coding: utf-8
Record.delete_all

# 対象年を設定
target_year = Time.now.strftime('%Y').to_i

# 閏年フラグを設定
if target_year % 4 == 0
  leap_year_flg = true
else
  leap_year_flg = false
end

# 対象月を設定
target_month = Time.now.strftime('%m').to_i

# 対象月の日数を設定
if [1, 3, 5, 7, 8, 10, 12].include?(target_month)
  has_days = 31
elsif [4, 6, 9, 11].include?(target_month)
  has_days = 30
else
  if leap_year_flg?
    has_days = 29
  else
    has_days = 28
  end
end

# year_monthカラムの値
regist_year_month = Time.now.strftime('%Y%m').to_i

#当月のデータを作成
1.upto(has_days) do |target_day|
  # start_datetimeカラムの値
  regist_start_datetime = Time.new(target_year, target_month, target_day, 10, 00, 00, '+01:00').to_time.to_s

  Record.create(
      year_month: regist_year_month,
      start_datetime: regist_start_datetime
  )
end