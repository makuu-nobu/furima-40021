class CreateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :ships do |t|
      t.string :post_code, null: false
      t.integer :region_id, null: false
      t.string :manicipality, null: false
      t.string :address, null: false
      t.string :add_address
      t.string :tell_address, null: false
      t.references :purchase, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
