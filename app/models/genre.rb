class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'マナー' },
    { id: 3, name: '心得' },
  ]

  include ActiveHash::Associations
  has_many :manners
end
