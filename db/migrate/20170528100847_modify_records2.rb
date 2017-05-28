class ModifyRecords2 < ActiveRecord::Migration[5.0]
  def change
    change_column :records, :registered_date, :string, :limit=>12
    change_column :records, :registered_division, :string, :limit=>1
  end
end
