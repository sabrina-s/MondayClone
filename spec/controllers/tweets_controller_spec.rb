require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe 'GET #home' do
    let(:user) { create(:user) }
    let!(:tweets) { create_list(:tweet, 5) }

    before do
      sign_in user
      get :home
    end

    it { expect(assigns(:tweet)).to be_a_new_record }
    it { expect(assigns(:tweets)).to eq(tweets) }
  end

  describe 'POST #create' do
    let(:user) {create(:user)}

    before do
      sign_in user
      post :create, params: {tweet: params}
    end

    context 'when tweet#save passes' do
      let(:params) {attributes_for(:tweet)}
      it {expect(response).to redirect_to root_path}
    end

    context 'when tweet#save fails' do
      let(:params) {attributes_for(:tweet, :invalid)}
      it {expect(response).to render_template(:home)}
    end

  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet, user: user) }

    before do
      sign_in user
      delete :destroy, params: {id: tweet}
    end

    it { expect(assigns(:tweet)).to eq(tweet) }
    it { expect(Tweet.count).to eq(0) }
    it { expect(response).to redirect_to root_path}
  end

end
