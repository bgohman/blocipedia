require 'rails_helper'

describe User do

  include TestFactories

  describe ".upgrade" do

    before do
      @user = authenticated_user
      @user.update(role: "premium")
    end
    it "changes the user's role to premium" do
      expect( @user.role ).to eq("premium")
    end
  end

  describe ".downgrade" do

    before do
      @user = authenticated_user(role: "premium")
      @user.update(role: "standard")
    end
    it "changes the user's role to standard" do
      expect( @user.role ).to eq("standard")
    end
  end
  
end