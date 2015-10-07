require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'index' do
    it 'should get index' do
      get 'index'
      expect(response).to render_template(:index)
    end
  end
  describe 'about' do
    it 'should get about' do
      get 'about'
      expect(response).to render_template(:about)
    end
  end
end