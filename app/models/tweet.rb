class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, :user_id, presence: true
  validates :body, length: {minimum: 1, maximum: 140}
end
