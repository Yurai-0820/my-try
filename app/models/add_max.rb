class AddMax
  include ActiveModel::Model
  attr_accessor :user_id, :training_id, :max_weight, :rep

  with_options presence: true do
    validates :max_weight
    validates :rep
    validates :item_id
    validates :user_id
  end


  def save

    max = Max.create(user_id: user_id, training_id: training_id)

    Limit.create(max_weight: max_weight, rep: rep, max_id: max.id)
  end
end
