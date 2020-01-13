class AddImeiToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :imei, :string
  end
end
