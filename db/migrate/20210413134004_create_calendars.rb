class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.integer    :max_weight, null: false
      t.integer    :rep,              null: false
      t.integer    :muscle_part_id,   null: false
      t.string    :training_name,     null: false
      t.references :training,              foreign_key: true
      t.references :user,              foreign_key: true
      t.references :limit,              foreign_key: true
      t.timestamps
    end
  end
end
