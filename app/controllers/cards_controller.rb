class CardsController < ApplicationController
  before_action :set_card, except: [:index, :create]

  def index
    @cards = current_user.wallet.cards
  end

  def show
  end

  def create
    @card = AddCard.call(current_user, card_params)
    if @card.persisted?
      render :show, status: :created
    else
      render json: @card.errors, status: :bad_request
    end
  end

  def destroy
    @card.destroy
  end

  private

  def set_card
    @card = current_user.wallet.cards.find(params[:id])
  end

  def card_params
    params.permit(:number, :due_date, :exp_date, :cvv, :limit)
  end
end
