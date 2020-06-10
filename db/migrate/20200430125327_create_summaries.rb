class CreateSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :summaries do |t|
      t.string :region
      t.string :route
      t.string :town
      t.string :order_stat
      t.date :dueout_date
      t.float :ext_price
      t.integer :no_orders

      t.timestamps
    end
  end
end
