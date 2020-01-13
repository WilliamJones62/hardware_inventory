class AddDisposedDateToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :disposed_date, :date
  end
end
