class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :addressee, null: false
      t.string :addresser, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
