class AddUserIdToLimit < ActiveRecord::Migration[6.0]
  def change
    add_column :limits, :user_id, :integer
  end
end
