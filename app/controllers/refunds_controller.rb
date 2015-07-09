class RefundsController < ApplicationController
  def new    
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "downgrade to standard - #{current_user.name}"
    }
  end

  def create
    charge = current_user.charges.last
    stripe_charge = Stripe::Charge.retrieve(charge.charge_id)
    refund_amount = (1500 * (1- (Date.today - charge.created_at.to_date) / 365)).to_f.round
    if refund = stripe_charge.refunds.create(amount:refund_amount)
      current_user.update(role: "standard")
      @user_wikis = current_user.wikis
      @user_wikis.each { |wiki| wiki.update_attribute(:private, false) }
      flash[:notice] = "You have been refunded #{view_context.number_to_currency(refund_amount/100, precision: 0)}.  Hope to have you back soon, #{current_user.email}!"
    end
      redirect_to root_path

  end



end
