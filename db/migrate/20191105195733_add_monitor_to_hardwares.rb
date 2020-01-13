class AddMonitorToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :monitor, :boolean
  end
end
