class AddManufactureYearToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :manufacture_year, :string
  end
end
