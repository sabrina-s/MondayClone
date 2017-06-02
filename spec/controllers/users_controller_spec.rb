require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:tweets) { create_list(:tweet, 10, user: user) }

    before { get :show }

    it { expect(assigns(:user)). to eq(user) }
    it { expect(assigns(:tweets)). to eq(tweets) }
  end

end
