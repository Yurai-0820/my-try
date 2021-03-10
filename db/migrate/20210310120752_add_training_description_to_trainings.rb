class AddTrainingDescriptionToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :training_description, :text
  end
end
