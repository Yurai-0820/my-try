class CreateLimits < ActiveRecord::Migration[6.0]
  def change
    create_table :limits do |t|
      t.integer    :max_weight, null: false
      t.integer    :rep,              null: false
      t.references :max,              foreign_key: true
      t.timestamps
    end
  end
end
