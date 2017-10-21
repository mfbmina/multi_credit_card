require 'rails_helper'

RSpec.describe PayInvoicesController, type: :controller do
  render_views

  let(:card) { create(:card, spent_value: 100) }
  let(:user) { card.wallet.user }

  before { request.headers.merge!('Authorization' => user.authentication_token) }

  describe 'POST create' do
    context 'with valid body' do
      let(:params) { { card_id: card.id, value: 50.0 } }

      before { post :create, params: params, format: :json }

      context 'when it it succesful' do
        it 'returns :ok' do
          expect(response.status).to eq(200)
        end

        it 'returns a json with the new spent_value' do
          expect(JSON.parse(response.body, symbolize_names: true)).to include(spent_value: '50.0')
        end
      end
    end

    context 'with invalid body' do
      it 'returns bad request' do
        post :create, params: { card_id: card.id }, format: :json
        expect(response.status).to eq(400)
      end

      it 'returns an error' do
        post :create, params: { card_id: card.id }, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(errors: ["param is missing or the value is empty: value"])
      end
    end

    context 'with invalid id' do
      it 'returns bad request' do
        post :create, params: { card_id: 999_999, value: 100 }, format: :json
        expect(response.status).to eq(404)
      end

      it 'returns an error' do
        post :create, params: { card_id: 999_999, value: 100 }, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)).to include(errors: ["Couldn't find Card with ID 999999"])
      end
    end
  end
end
