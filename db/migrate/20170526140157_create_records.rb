class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.integer :user_id    # ユーザーID
      t.string :registered_date, :limit=>12  # 登録時間
      t.string :registered_division, :limit=>1    # 出勤区分（1:出勤、2:退勤）

      t.timestamps
    end
  end
end
