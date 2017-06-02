require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe 'GET #home' do
    let!(:tweets) { create_list(:tweet, 5) }

    before { get :home }

    it { expect(assigns(:tweets)).to eq(tweets) }
  end

  # describe 'GET #show' do
  #   let(:tweet) { create(:tweet) }
  #
  #   before { get :show, params: {id: tweet} }
  #
  #   it { expect(assigns(:tweet)).to eq(tweet) }
  # end
  #
  # describe 'GET #new' do
  #   before { get :new }
  #
  #   it { expect(assigns(:tweet)).to be_a_new_record }
  # end
  #
  # describe 'POST #create' do
  #   let(:tweet) { create(:tweet) }
  #
  #   before { post :create, params: { tweet: params } }
  #
  #   context 'when tweet#save passes' do
  #     let(:params) { attributes_for(:tweet) }
  #     it { expect(response).to redirect_to tweets_path }
  #   end
  #   context 'when tweet#save fails' do
  #     let(:params) { attributes_for(:tweet, :invalid) }
  #     it { expect(response).to render_template(:new) }
  #   end
  # end
  #
  # describe 'DELETE #destroy' do
  #   let(:user) { delete(:tweet) }

  #
  # end

end
