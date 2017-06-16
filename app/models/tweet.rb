class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :tags, :uniq => true

  max_body_length = 140

  validates :body, :user_id, presence: true
  validates :body, length: {minimum: 1, maximum: max_body_length}

  def self.search(search)
    where("body ILIKE ?", "%#{search}%")
  end

  def self.save_hashtag(tweet)
    body = tweet.body
    body.scan(/(?<=\s|^)#(\w*[A-Za-z_]+\w*)/).flatten.each do |tag|
      tweet.tags.create(body: tag.downcase)
    end
  end
  
end