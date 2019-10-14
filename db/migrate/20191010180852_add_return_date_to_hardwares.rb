class AddReturnDateToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :return_date, :date
  end
end
