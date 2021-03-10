class CreateManners < ActiveRecord::Migration[6.0]
  def change
    create_table :manners do |t|
      t.integer :genre_id,        null: false
      t.string :title,        null: false
      t.text :description,        null: false
      t.references :user,               foreign_key: true


      t.timestamps
    end
  end
end
