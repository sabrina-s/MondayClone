require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe 'GET #home' do
    let(:user) { create(:user) }
    let!(:tweets) { create_list(:tweet, 5) }

    before do
      sign_in user
      get :home
    end

    it { expect(assigns(:tweets)).to eq(tweets) }
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet) }

    context 'when signed in as user' do
      before { sign_in user }

      it { expect(get(:show, user_id: user, id: tweet)).to redirect_to(user_tweet_path(id:tweet)) }
    end

    context 'when not signed in as user' do
      before { get :show, user_id: user, id: tweet }

      it { expect(assigns(:tweet)).to eq(tweet) }
      it { expect(response).to render_template :show }
    end
  end

  describe 'GET #new' do

    before do
      sign_in user
      get :new
    end

    it { expect(assigns(:tweet)).to be_a_new_record }
  end

  describe 'POST #create' do
    let(:tweet) { create(:tweet) }

    before do
      sign_in user
      post :create, params: { tweet: params }
    end

    context 'when tweet#save passes' do
      let(:params) { attributes_for(:tweet) }
      it { expect(response).to redirect_to tweets_path }
    end
    context 'when tweet#save fails' do
      let(:params) { attributes_for(:tweet, :invalid) }
      it { expect(response).to render_template(:new) }
    end
  end

  # not done yet
  describe 'DELETE #destroy' do
    let(:user) { delete(:tweet) }
  end

end
