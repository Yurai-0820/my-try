class Limit < ApplicationRecord
  belongs_to :max
  belongs_to :user
  belongs_to :training

  with_options presence: true do
    validates :max_weight
    validates :rep
  end
  end
