class DayTrainingTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1時間' },
    { id: 3, name: '2時間' },
    { id: 4, name: '3時間' }
  ]

  include ActiveHash::Associations
  has_many :users
end
