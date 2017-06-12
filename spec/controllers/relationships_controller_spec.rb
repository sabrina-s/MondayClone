require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do

  describe 'POST #create' do
    let(:user) { create(:user) }

    before do
      sign_in user
      post :create, xhr:true, params: {followed_id: user.id}
    end

    it { expect(assigns(:user)).to eq(user) }

  end
  
  describe 'DELETE #destroy' do
  
  end

end