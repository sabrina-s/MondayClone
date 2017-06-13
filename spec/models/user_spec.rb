require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets) }
  it { should have_many(:likes) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it do
    should validate_length_of(:username).
    is_at_least(6)
  end

  describe 'validates unqiueness of' do
    let(:user) { create(:user) }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity}
  end

  describe 'validates a method to check whether current user is following the other user' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let!(:relationship) { create(:relationship, follower: user1, followed: user2)}

    it { expect(user1.following?(user2)).to eq(true) }
  end
end
