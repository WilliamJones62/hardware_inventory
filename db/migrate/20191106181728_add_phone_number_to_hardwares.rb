class AddPhoneNumberToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :phone_number, :string
  end
end
