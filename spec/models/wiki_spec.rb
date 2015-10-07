require 'rails_helper'

RSpec.describe Wiki, type: :model do

  before do
    @wiki = Wiki.create(title: 'wiki title', body: 'wiki body')
  end

  describe 'relationships' do
  	it { should have_many(:collaborations) }
  	it { should have_many(:users).through(:collaborations) }
  	it { should belong_to(:user) }
  end

  describe '.publicly_viewable' do
  	it 'includes wikis that are not private' do
  	  @wiki.update(private: false)
  	  expect(Wiki.publicly_viewable).to include(@wiki)
  	end
  	it 'excludes wikis that are private' do
      @wiki.update(private: true)
  	  expect(Wiki.publicly_viewable).not_to include(@wiki)
    end
  end

end