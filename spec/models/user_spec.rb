require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets) }
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
end
