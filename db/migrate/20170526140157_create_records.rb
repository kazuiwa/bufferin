class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.integer :user_id    # ユーザーID
      t.datetime :start_at  # 出勤日時
      t.datetime :end_at    # 退勤日時

      t.timestamps
    end
  end
end
