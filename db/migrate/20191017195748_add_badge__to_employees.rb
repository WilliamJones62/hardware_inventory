class AddBadgeToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :Badge_, :string
  end
end
