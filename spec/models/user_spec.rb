require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = authenticated_user
    @admin = admin_user
  end

  include TestFactories

  describe ".upgrade" do
    before do
      @user.update(role: 'standard')
    end
    it "changes the user's role to premium" do
      @user.upgrade
      expect( @user.role ).to eq('premium')
    end
  end

  describe ".downgrade" do
    before do
      @user.update(role: 'premium')
    end
    it "changes the user's role to standard" do
      @user.downgrade
      expect( @user.role ).to eq('standard')
    end
  end

  describe ".admin?" do
    it "returns true if the user is an admin user" do
      expect(@admin.admin?).to eq(true)
    end
    it "returns false if the user is not an admin" do
      expect(@user.admin?).to eq(false)
    end
  end

  describe ".premium?" do
    it "returns true if the user is an premium user" do
      @user.update(role: 'premium')
      expect(@user.premium?).to eq(true)
    end
    it "returns false if the user is not an premium" do
      @user.update(role: 'standard')
      expect(@user.premium?).to eq(false)
    end
  end

  describe ".standard?" do
    it "returns true if the user is an standard user" do
      @user.update(role: 'standard')
      expect(@user.standard?).to eq(true)
    end
    it "returns false if the user is not an standard" do
      @user.update(role: 'premium')
      expect(@user.standard?).to eq(false)
    end
  end

  describe 'init' do
    it 'sets the user role to standard if none is specified' do
      @user.init
      expect(@user.role).to eq('standard')
    end
    it 'does not change the user role is one is already set' do
      @user.update(role: 'premium')
      @user.init
      expect(@user.role).to eq('premium')
    end
  end

  describe 'relationships' do
    it { should have_many(:wikis) }
    it { should have_many(:charges) }
    it { should have_many(:collaborations) }
    it { should have_many(:wiki_collaborations).through(:collaborations) }
  end

end