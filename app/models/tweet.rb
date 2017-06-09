class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, :user_id, presence: true
  validates :body, length: {minimum: 1, maximum: 140}

  def self.search(search)
    if search
      find(:all, :conditions => ['body LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
