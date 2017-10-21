class PayInvoicesController < ApplicationController
  before_action :set_card

  def create
    if PayInvoice.call(@card, payment_params)
      render 'cards/show'
    else
      render json: { errors: ["You can't pay more than you spent"] }, status: :bad_request
    end
  end

  private

  def set_card
    @card = current_user.wallet.cards.find(params[:card_id])
  end

  def payment_params
    params.require(:value)
  end
end
