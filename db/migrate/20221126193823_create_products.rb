class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :type
      t.integer :quantity
      t.digit :price
      t.timestamps
    end
  end
end
