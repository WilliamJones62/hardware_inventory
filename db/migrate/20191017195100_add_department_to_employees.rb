class AddDepartmentToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :Department, :string
  end
end
