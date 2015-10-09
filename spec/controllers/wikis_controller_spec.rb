require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_wiki) { create(:wiki) }
  context 'authenticated user' do
    before do
      @user = create(:user)
      sign_in(@user)
    end
    describe 'POST create' do
      it 'creates a new wiki' do
        expect {
          post :create, wiki: attributes_for(:wiki)
        }.to change(Wiki, :count).by(1)
      end
      it 'sets a flash[:notice]' do
        post :create, wiki: attributes_for(:wiki)
        expect(flash[:notice]).to eq("Wiki was saved.")
      end
      it 'redirects to wiki' do
        post :create, wiki: attributes_for(:wiki)
        expect(response).to redirect_to(assigns[:wiki])
      end
    end
  end
end