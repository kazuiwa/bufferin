class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :year        # => 年
      t.string :month       # => 月
      t.string :day         # => 日
      t.datetime :start_datetime  # => 出勤日時
      t.datetime :end_datetime    # => 退勤日時
      t.float :working_hours      # => 勤務時間
      t.timestamps
    end
  end

  def down
    drop_table :records
  end
end
