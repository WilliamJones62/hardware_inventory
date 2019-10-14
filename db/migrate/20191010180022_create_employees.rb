class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :Employee_Status
      t.string :Lastname
      t.string :Firstname
      t.string :image
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
