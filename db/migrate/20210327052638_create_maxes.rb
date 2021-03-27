class CreateMaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :maxes do |t|
      t.references :user, foreign_key: true
      t.references :training, foreign_key: true
      t.timestamps
    end
  end
end
