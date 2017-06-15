require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do

  describe 'POST #create' do
    let(:user) { create(:user) }

    before do
      sign_in user
      post :create, xhr:true, params: {followed_id: user.id}
    end

    it { expect(assigns(:user)).to eq(user) }
    it { expect(response).to render_template(:create) }
  end
  
  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:relationship) { create(:relationship, followed_id: user.id) }

    before do
      sign_in user
      delete :destroy, xhr:true, params: {id: relationship.id}
    end

    it { expect(assigns(:user)).to eq(user) }
    it { expect(response).to render_template(:destroy) }
  end

end