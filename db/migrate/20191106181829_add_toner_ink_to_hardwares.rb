class AddTonerInkToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :toner_ink, :string
  end
end
