class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :tags

  max_body_length = 140

  validates :body, :user_id, presence: true
  validates :body, length: {minimum: 1, maximum: max_body_length}

  def self.search(search)
    where("body ILIKE ?", "%#{search}%")
  end
end
