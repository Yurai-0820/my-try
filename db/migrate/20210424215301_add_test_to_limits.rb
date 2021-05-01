class AddTestToLimits < ActiveRecord::Migration[6.0]
  def change
    add_column :limits, :user_id, :integer
    add_column :limits, :training_id, :integer
  end
end
