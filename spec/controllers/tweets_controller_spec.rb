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

  describe 'GET #reply' do
    let(:user1) {create(:user)}
    let(:user2) {create(:user)}

    before do
      sign_in user1
      get :reply, params: {reply_to_tweet_id: 1, reply_to_user_id: user2}
    end

    it {expect(response).to redirect_to root_path(params: {reply_id: 1, body: "@" + user2.username + " "})}
  end

  describe 'GET #search' do
    let(:tweet) { create(:tweet, body: "hello") }
    let(:params) { :tweet }

    before do
      get :search, params: { search: params }
    end

    context 'keyword found' do
      it {expect(response).to have_http_status(:ok)}
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }

    context 'show the selected tweet' do
      let(:tweet) { create(:tweet, reply_id: nil) }

      before do
        sign_in user
        get :show, params: {id: tweet}
      end

      it { expect(assigns(:tweet)).to eq(tweet) }
    end

    context 'show replies belong to the selected tweet' do
      let(:tweet) { create(:tweet) }
      let!(:tweet_replies) { create(:tweet, reply_id: tweet.id) }

      before do
        sign_in user
        get :show, params: {id: tweet}
      end

      it { expect(assigns(:tweet_replies)).to match_array(tweet_replies) }
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }

    before do
      sign_in user
      post :create, xhr:true, params: { tweet: params }
    end

    context 'when tweet#save passes' do
      let(:params) { attributes_for(:tweet) }
      it {expect(response).to render_template(:create)}
    end

    context 'when tweet#save fails' do
      let(:params) {attributes_for(:tweet, :invalid)}
      it {expect(response).to render_template(:create)}
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet, user: user) }

    before do
      sign_in user
      delete :destroy, params: { id: tweet }
    end

    it { expect(assigns(:tweet)).to eq(tweet) }
    it { expect(Tweet.count).to eq(0) }
    it { expect(response).to redirect_to root_path }
  end
end
