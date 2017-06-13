class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, :user_id, presence: true
  validates :body, length: {minimum: 1, maximum: 140}

  def self.search(search)
    where("body ILIKE ?", "%#{search}%")
  end
end
