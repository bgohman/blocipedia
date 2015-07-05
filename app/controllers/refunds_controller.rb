class RefundsController < ApplicationController
  def new    
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "downgrade to standard - #{current_user.name}"
    }
  end

  def create
    current_user.update_attribute(:role, "standard")
    @user_wikis = current_user.wikis
    @user_wikis.each { |wiki| wiki.update_attribute(:private, false) }
    flash[:notice] = "Hope to have you back soon, #{current_user.email}!"
    redirect_to root_path

  end



end
