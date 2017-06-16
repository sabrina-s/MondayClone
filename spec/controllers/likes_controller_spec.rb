require 'rails_helper'

RSpec.describe LikesController, type: :controller do  

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet, user: user) }
    let(:like) { create(:like) }

    context "when #create is sent from home.html" do
      before do
        sign_in user
        post :create, params: { id: tweet, path: "tweet" }
      end

      it { expect(response).to redirect_to root_path }
    end

    context "when #create is sent from user's show.html" do
      before do
        sign_in user
        post :create, params: { id: tweet, path: "user" }
      end

      it { expect(response).to redirect_to user_path(user.username) }    
    end

  end
  
  describe 'DELETE #destroy' do
    let(:user) { create(:user) }  
    let(:tweet) { create(:tweet, user: user) }  
    let!(:like) { create(:like, tweet: tweet, user: user) }

    context "when #destroy is sent from home.html" do
      before do
        sign_in user
        delete :destroy, params: { id: tweet, path: "tweet" }
      end

      it { expect(response).to redirect_to root_path }
    end

    context "when #destroy is sent from user's show.html" do
      before do
        sign_in user
        delete :destroy, params: { id: tweet, path: "user" }
      end

      it { expect(response).to redirect_to user_path(user.username) }    
    end
  end
  
end