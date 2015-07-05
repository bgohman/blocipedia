class RefundsController < ApplicationController
  def new    
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "downgrade to standard - #{current_user.name}"
    }
  end

  def create

    current_user.update_attribute(:role, "standard")
    redirect_to root_path

  end



end
