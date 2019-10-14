class AddEmployeeIdToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :employee_id, :integer
  end
end
