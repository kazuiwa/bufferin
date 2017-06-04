class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :for_test
      t.timestamps
    end
  end

  def down
    drop_table :records
  end
end
