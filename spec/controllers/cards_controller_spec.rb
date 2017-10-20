require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  render_views

  let(:card) { create(:card) }
  let(:user) { card.wallet.user }

  before { request.headers.merge!('Authorization' => user.authentication_token) }

  describe 'GET index' do
    before { get :index, format: :json }

    it 'returns success' do
      expect(response.status).to eq(200)
    end

    it 'assigns @cards' do
      expect(assigns(:cards)).to eq([card])
    end

    it 'returns a json' do
      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        [{
          id: card.id,
          truncate_number: card.truncate_number,
          limit: card.limit.to_f.to_s,
          spent_value: card.spent_value.to_f.to_s,
          exp_date: card.exp_date.strftime('%Y-%m-%d'),
          due_date: card.due_date.strftime('%Y-%m-%d')
        }]
      )
    end
  end


  describe 'GET show' do
    context 'with a valid id' do
      before { get :show, params: { id: card.id }, format: :json }

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'assigns @card' do
        expect(assigns(:card)).to eq(card)
      end

      it 'returns a json' do
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          id: card.id,
          truncate_number: card.truncate_number,
          limit: card.limit.to_f.to_s,
          spent_value: card.spent_value.to_f.to_s,
          exp_date: card.exp_date.strftime('%Y-%m-%d'),
          due_date: card.due_date.strftime('%Y-%m-%d')
        )
      end
    end

    context 'with an invalid id' do
      it 'returns not found' do
        get :show, params: { id: 999_999 }, format: :json
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'POST create' do
    context 'with valid body' do
      let(:params) { attributes_for(:card) }

      it 'returns created' do
        post :create, params: params, format: :json
        expect(response.status).to eq(201)
      end

      it 'creates a card' do
        expect { post :create, params: params, format: :json }.to change { Card.count }.by(1)
      end

      it 'returns a json' do
        post :create, params: params, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)).to eq({
          id: 2,
          truncate_number: '************1111',
          limit: "1000.0",
          spent_value: "0.0",
          exp_date: "2022-10-01",
          due_date: "2017-10-30"
        })
      end
    end

    context 'with invalid body' do
      it 'returns bad request' do
        post :create, params: {}, format: :json
        expect(response.status).to eq(400)
      end

      it 'not create a card' do
        expect { post :create, params: {}, format: :json }.to change { Card.count }.by(0)
      end

      it 'returns a json' do
        post :create, params: {}, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          number: ["can't be blank", "is not a number"],
          due_date: ["can't be blank"],
          exp_date: ["can't be blank"],
          cvv: ["can't be blank", "is the wrong length (should be 3 characters)"]
        )
      end
    end
  end

  describe 'DELETE destroy' do
    context 'with a valid id' do
      before { delete :destroy, params: { id: card.id }, format: :json }

      it 'returns no content' do
        expect(response.status).to eq(204)
      end

      it 'assigns @card' do
        expect(assigns(:card)).to eq(card)
      end
    end

    context 'with an invalid id' do
      it 'returns not found' do
        delete :destroy, params: { id: 999_999 }, format: :json
        expect(response.status).to eq(404)
      end
    end
  end
end
