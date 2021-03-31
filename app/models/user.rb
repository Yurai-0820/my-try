class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purpose_body
  belongs_to :day_training_time

 has_many :trainings
 has_many :maxes
 has_many :manners

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'


         with_options presence: true do
          validates :nickname
          validates :age, format: { with: /\A[0-9]\z/, message: 'is invalid. input harf-width characters.' }
          with_options numericality: { other_than: 1 } do
            validates :purpose_body_id
            validates :day_training_time_id
          end
        end



end
