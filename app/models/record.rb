class Record
  include ActiveModel::Model
  attr_accessor :max_weight, :rep, :max_id, :user_id, :set, :menu, :start_time, :rep, :weight, :user_id)
  with_options presence: true do
  end

  
    
end