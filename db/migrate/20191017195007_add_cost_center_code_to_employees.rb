class AddCostCenterCodeToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :Cost_Center_Code, :string
  end
end
