class CreateHardwares < ActiveRecord::Migration[5.2]
  def change
    create_table :hardwares do |t|
      t.string :owner
      t.string :host
      t.string :os
      t.string :os_version
      t.date :install_date
      t.date :boot_time
      t.string :make
      t.string :model
      t.string :type
      t.string :processor
      t.integer :physical_memory
      t.integer :available_physical_memory
      t.string :serial_number

      t.timestamps
    end
  end
end
