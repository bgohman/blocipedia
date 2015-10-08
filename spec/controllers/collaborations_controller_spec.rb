require 'rails_helper'

RSpec.describe CollaborationsController, type: :controller do
  before do
    @user = authenticated_user(name: 'user')
    @other_user = authenticated_user(name: 'other_user')
    @wiki = new_wiki
  end

  describe 'new' do
    it 'should get a new collaboration instance variable' do
      # not sure how to test without a route
      #get :new
      #expect(assigns(:collaboration)).to be_a_new(Collaboration)
    end
  end

  describe 'create' do
    context 'when valid' do
      before do
        post :create, collaboration: {wiki_id: @wiki.id, collaboration: {user_id: @other_user.email}}
      end
      it 'adds another user as a collaborator to a wiki' do
        expect(@wiki.users).to include(@other_user)
      end
      it 'sets a flash[:notice]' do
        expect(flash[:notice]).to eq("#{@other_user.name} has been added as a collaborator for this wiki.")
      end
      it 'redirects' do
        expect(response).to redirect_to(edit_wiki_path(@wiki))
      end
    context 'when not valid' do
      xit 'shows a message and redirects to edit wiki if an unkown email is entered' do

      end
      xit 'shows a message and redirects to edit wiki if an the other user is already a collaborator' do

      end
    end


  end

end