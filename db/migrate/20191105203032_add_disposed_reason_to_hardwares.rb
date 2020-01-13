class AddDisposedReasonToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :disposed_reason, :string
  end
end
