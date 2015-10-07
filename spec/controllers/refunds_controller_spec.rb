require 'rails_helper'
include TestFactories


RSpec.describe RefundsController, type: :controller do
  before do
    @user = authenticated_user(name: 'test')
  end

  describe 'new' do
    it 'should set a stripe_btn_data instance variable with key and description' do
      sign_in @user
      get :new
      stripe = assigns(:stripe_btn_data)
      expect(stripe[:description]).to eq("downgrade to standard - #{@user.name}")
      #TODO - expect(stripe[:key]).to eq("SOME VALUE")
    end
  end

  describe 'create' do
    it 'should refund the previous charge' do

    end
    it 'should downgrade the user to standard' do

    end
  end
end