class PurposeBody < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '筋肉をつけて体重を上げたい(筋トレメイン)' },
    { id: 3, name: '筋肉をつけて体脂肪を落としたい(筋トレ8割,有酸素2割)' },
    { id: 4, name: 'とにかく体脂肪を落としたい(筋トレ6割,有酸素4割)' }
  ]

  include ActiveHash::Associations
  has_many :users
end
