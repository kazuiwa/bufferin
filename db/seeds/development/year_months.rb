# coding: utf-8
YearMonth.delete_all
#本年度の月データを作成
1.upto(12) do |idx|
  regist_id = Time.now.strftime('%Y')
  if idx < 10
    regist_id += "0"
    regist_id += idx.to_s
  else
    regist_id += idx.to_s
  end
  YearMonth.create(id: regist_id.to_i)
end