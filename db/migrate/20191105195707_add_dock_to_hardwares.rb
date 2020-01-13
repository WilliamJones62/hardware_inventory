class AddDockToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :dock, :boolean
  end
end
