class AddComputerNameToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :computer_name, :string
  end
end
