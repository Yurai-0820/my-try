class Limit < ApplicationRecord
  belongs_to :max
  has_many :calendars
end
