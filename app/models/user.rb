class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, :email, :password, presence: true
  validates :username, length: { minimum: 6 }
  validates :username, uniqueness: {case_sensitive: false }
end
