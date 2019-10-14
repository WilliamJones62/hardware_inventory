class AddIssueDateToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :issue_date, :date
  end
end
