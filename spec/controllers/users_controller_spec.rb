require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do

    context 'get the selected user' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :show, params: {id: user}
      end

      it { expect(assigns(:user)). to eq(user) }
    end

    context 'show and count the tweets that are belonged to the selected user' do
      let(:user) { create(:user) }
      let(:tweets) { create_list(:tweet, 10, user: user) }
      let!(:tweets_count) {tweets.count}

      before do
        sign_in user
        get :show, params: {id:user}
      end
      
      it { expect(assigns(:tweets)). to eq(tweets) }
      it { expect(assigns(:tweets_count)). to eq(tweets_count) }
    end

    context 'show and count the tweets that the selected user likes' do
      let(:user) { create(:user) }
      let(:tweet1) { create(:tweet, user: user) }
      let(:tweet2) { create(:tweet, user: user) }
      let(:tweet3) { create(:tweet) }
      let(:tweet4) { create(:tweet) }
      let(:like1) { create(:like, user: user, tweet: tweet1) }
      let(:like2) { create(:like, user: user, tweet: tweet2) }
      let(:like3) { create(:like, user: user, tweet: tweet3) }
      let(:like4) { create(:like, user: user, tweet: tweet4) }
      let(:likes) { [like1] + [like2] + [like3] + [like4]}
      let(:tweets_by_others) { [tweet3] + [tweet4] }
      let!(:likes_count) {likes.count - tweets_by_others.count}

      before do
        sign_in user
        get :show, params: {id:user}
      end
      
      it { expect(assigns(:likes)). to eq(likes) }
      it { expect(assigns(:likes_count)). to eq(likes_count) }      
    end



  end
end
