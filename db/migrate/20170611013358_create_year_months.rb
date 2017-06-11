class CreateYearMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :year_months do |t|

      t.timestamps
    end
  end

  def down
    drop_table :year_months
  end
end