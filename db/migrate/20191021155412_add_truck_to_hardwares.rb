class AddTruckToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :truck, :boolean
  end
end
