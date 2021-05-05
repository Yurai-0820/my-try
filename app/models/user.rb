class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purpose_body
  belongs_to :day_training_time

  has_many :trainings
  has_many :maxes
  has_many :manners

  has_many :limits
  has_many :memos
  has_many :limits


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :age, format: { with: /\A[0-9]+\z/, message: 'is invalid. input harf-width characters.' }
    with_options numericality: { other_than: 1 } do
      validates :purpose_body_id
      validates :day_training_time_id
    end
  end

  # def user
  #   #インスタンスメソッドないで、selfはインスタンス自身を表す
  #   return User.find_by(id: self.user_id)
  # end
end
