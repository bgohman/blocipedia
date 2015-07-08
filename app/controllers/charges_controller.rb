class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "upgrade to premium - #{current_user.name}"
    }
  end

  def create
    @amount ||= 1500

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => "premium membership for #{current_user.email}",
      :currency => 'usd'
    )
  
  current_user.update(role:, "premium")
  flash[:notice] = "Thank you for supporting blocipedia, #{current_user.email}!"
  redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end



end
