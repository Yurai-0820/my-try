class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.integer :muscle_part_id,        null: false
      t.string :training_name,          null: false
      t.string :target_muscle,          null: false
      t.text :training_description,        null: false
      t.string :video_url,              null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end
