class Tag < ApplicationRecord
  has_and_belongs_to_many :tweets, :uniq => true
end