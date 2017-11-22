class CreateBags < ActiveRecord::Migration[5.1]
  def change
    create_table :bags do |t|
      t.string :name
      t.integer :passenger_id
      t.timestamps
    end
  end
end
