class AddHardwareToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hardware, :boolean
  end
end
