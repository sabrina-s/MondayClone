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
      it { expect(assigns(:likes_count)).to eq(likes_count) }      
    end

    context 'Count the number of followed' do
      let(:user1) { create(:user) }
      let(:user2) { create(:user) }
      let(:user3) { create(:user) }
      let(:following1) { create(:relationship, follower: user1, followed: user2) }
      let(:following2) { create(:relationship, follower: user1, followed: user3) }
      let(:following) { [following1] + [following2] }
      let!(:following_count) { following.count }

      before do
        sign_in user1
        get :show, params: {id:user1}
      end

      it { expect(assigns(:following)).to eq(following_count) }
    end
  end

  describe 'GET the list of following of a user' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }
    let(:following1) { create(:relationship, follower: user1, followed: user2) }
    let(:following2) { create(:relationship, follower: user1, followed: user3) }
    let!(:following) { [following1.followed] + [following2.followed] }

    before do
      sign_in user1
      get :following, params: {id: user1}
    end

    it { expect(assigns(:title)).to eq("Following") }
    it { expect(assigns(:users)).to eq(following) }
    it { expect(response).to render_template(:show_follow) }
  end

  describe 'GET the list of followers of a user' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }
    let(:follower1) { create(:relationship, follower: user3, followed: user1) }
    let(:follower2) { create(:relationship, follower: user2, followed: user1) }
    let(:followers) { [follower1.follower] + [follower2.follower] }

    before do
      sign_in user1
      get :followers, params: {id: user1}
    end
    
    it { expect(assigns(:title)).to eq("Followers") }
    it { expect(assigns(:users)).to eq(followers) }
    it { expect(response).to render_template(:show_follow) }
  end

end
