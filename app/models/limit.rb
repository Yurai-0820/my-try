class Limit < ApplicationRecord
  belongs_to :max
  belongs_to :user


  # def limits
  #   return Limit.where(user_id: self.id)
  # end
  
end