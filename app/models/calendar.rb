class Calendar < ApplicationRecord
  belongs_to :user
  belongs_to :training
  belongs_to :limit
end
