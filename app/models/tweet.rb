class Tweet < ApplicationRecord
  belongs_to :user

  validates_presence_of :body, :user_id
end
