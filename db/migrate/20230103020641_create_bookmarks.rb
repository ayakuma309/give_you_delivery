class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :delivery, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :delivery_id], unique: true
  end
end
