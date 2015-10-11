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

    describe 'GET index' do
      it 'assigns viewable wikis to @wikis' do
        public_wiki = create(:wiki)
        get :index
        expect(assigns(:wikis)).to include(public_wiki)
      end
      it 'does not include private wikis' do
        private_wiki = create(:wiki, private: true)
        get :index
        expect(assigns(:wikis)).not_to include(private_wiki)
      end
      #https://www.relishapp.com/rspec/rspec-rails/docs/matchers/render-template-matcher
      xit "renders the index template" do
        subject { get :index }
        expect(subject).to render_template(:index)
      end
    end

    describe 'GET new' do
      it 'assigns a new wiki to @wiki' do
        get :new
        expect(assigns(:wiki)).to be_a_new(Wiki)
      end
      it 'assigns current_user to @user' do
        get :new
        expect(assigns(:user)).to eq(@user)
      end
    end

    describe 'GET edit' do
      before do
        get :edit, { id: my_wiki.to_param }
      end
      it 'assigns the selected wiki to @wiki' do
        expect(assigns(:wiki)).to eq(my_wiki)
      end
      it "assigns @wiki's collaborations to @collaborations" do
        #how would I do this with Factory Girl?
        expect(assigns(:collaborations).length).to eq(0)
        my_wiki.collaborations.build(user: @user)
        my_wiki.save
        get :edit, { id: my_wiki.to_param }
        expect(assigns(:collaborations).length).to eq(1)
      end
    end

    describe 'GET show' do
      it 'assigns wiki to @wiki' do
        get :show, { id: my_wiki.to_param }
        expect(assigns(:wiki)).to eq(my_wiki)
      end
    end

    describe 'PATCH update' do
      before do
        patch :update, id: my_wiki.to_param, wiki: { title: "update test"}
      end
      it 'assigns the selected wiki to @wiki' do
        expect(assigns(:wiki)).to eq(my_wiki)
      end
      it "updates the wiki" do
        my_wiki.reload
        expect(my_wiki.title).to eq("update test")
      end
      it 'redirects to wiki' do
        expect(response).to redirect_to(assigns[:wiki])
      end
    end

    describe 'DELETE destroy' do
      #????
      before do
        my_wiki.user = @user
        delete :destroy, { id: my_wiki.to_param }
      end
      xit 'deletes the wiki' do
        expect(Wiki.all).not_to include(my_wiki)
      end
      xit 'redirects to wikis index' do
        expect(response).to redirect_to(wikis_path)
      end

    end
  end
end