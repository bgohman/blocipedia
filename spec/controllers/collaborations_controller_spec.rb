require 'rails_helper'

RSpec.describe CollaborationsController, type: :controller do
  before do
    @user = authenticated_user(name: 'user')
    @other_user = authenticated_user(name: 'other_user')
    @wiki = new_wiki
    @collaboration = Collaboration.create(wiki: @wiki, user: @other_user)
  end

  describe 'new' do
    it 'should get a new collaboration instance variable' do
      # not sure how to test without a route
      #get :new
      #expect(assigns(:collaboration)).to be_a_new(Collaboration)
    end
  end

  describe 'create' do
    it 'adds another user as a collaborator to a wiki' do
      params = 5
      post :create
    end
    it 'shows a message and redirects to edit wiki if an unkown email is entered' do

    end
    it 'shows a message and redirects to edit wiki if an the other user is already a collaborator' do

    end


  end

end