class Training < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :muscle_part
  belongs_to :user
  has_one :max

  with_options presence: true do
    with_options numericality: { other_than: 1 } do
    validates :muscle_part_id
    end
    validates :training_name
    validates :target_muscle
    validates :training_description
    validates :video_url
  end
end
