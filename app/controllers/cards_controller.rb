class CardsController < ApplicationController
  before_action :set_user
  before_action :set_card, except: :create

  def show
  end

  def create
    @card = AddCard.call(@user, card_params)
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_card
    @card = @user.wallet.cards.find(params[:id])
  end

  def card_params
    params.permit(:number, :due_date, :exp_date, :cvv, :limit)
  end
end
