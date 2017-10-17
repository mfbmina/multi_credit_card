require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe 'GET index' do
    let!(:user) { create(:user) }

    before { get :index, format: :json }

    it 'returns success' do
      expect(response.status).to eq(200)
    end

    it 'assigns @users' do
      expect(assigns(:users)).to eq([user])
    end

    it 'returns a json' do
      expect(JSON.parse(response.body, symbolize_names: true)).to eq(
        [{
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          full_name: user.full_name,
          email: user.email,
          url: user_url(user)
        }]
      )
    end
  end

  describe 'GET show' do
    context 'with a valid id' do
      let(:user) { create(:user) }
      let(:wallet) { create(:wallet, user: user) }
      let!(:card) { create(:card, wallet: wallet) }

      before { get :show, params: { id: user.id }, format: :json }

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'returns a json' do
        expect(JSON.parse(response.body, symbolize_names: true)).to eq({
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          full_name: user.full_name,
          email: user.email,
          wallet: {
            limit: wallet.limit.to_f.to_s,
            max_limit: wallet.max_limit.to_f.to_s,
            cards: [{
              id: card.id,
              truncate_number: card.truncate_number,
              exp_date: card.exp_date.strftime('%Y-%m-%d'),
              url: user_card_url(user, card)
            }]
          }
        })
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
      let(:params) { { email: 'example@mail.com', first_name: 'Example', last_name: 'Example' } }

      it 'returns created' do
        post :create, params: params, format: :json
        expect(response.status).to eq(201)
      end

      it 'creates a user' do
        expect { post :create, params: params, format: :json }.to change { User.count }.by(1)
      end

      it 'returns a json' do
        post :create, params: params, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)).to eq({
          id: 1,
          first_name: 'Example',
          last_name: 'Example',
          full_name: 'Example Example',
          email: 'example@mail.com',
          wallet: {
            limit: "0.0",
            max_limit: "0.0",
            cards: []
          }
        })
      end
    end

    context 'with invalid body' do
      it 'returns bad request' do
        post :create, params: {}, format: :json
        expect(response.status).to eq(400)
      end

      it 'not create a user' do
        expect { post :create, params: {}, format: :json }.to change { User.count }.by(0)
      end

      it 'returns a json' do
        post :create, params: {}, format: :json
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          first_name: ["can't be blank"],
          last_name: ["can't be blank"],
          email: ["can't be blank"]
        )
      end
    end
  end

  describe 'PATCH update' do
    let(:user) { create(:user) }

    before do
      create(:wallet, user: user)
      patch :update, params: params, format: :json
    end

    context 'with valid body' do
      let(:params) { { id: user.id, email: 'example@mail.com' } }

      it 'returns success' do
        expect(response.status).to eq(200)
      end

      it 'returns a json' do
        expect(JSON.parse(response.body, symbolize_names: true)).to eq({
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          full_name: user.full_name,
          email: 'example@mail.com',
          wallet: {
            limit: user.wallet.limit.to_f.to_s,
            max_limit: user.wallet.max_limit.to_f.to_s,
            cards: []
          }
        })
      end
    end

    context 'with invalid body' do
      let(:params) { { id: user.id, email: '' } }

      it 'returns bad request' do
        expect(response.status).to eq(400)
      end

      it 'returns a json' do
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(email: ["can't be blank"])
      end
    end

    context 'with invalid id' do
      let(:params) { { id: 999_999, email: 'example2@mail.com' } }

      it 'returns not found' do
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'with a valid id' do
      let(:user) { User.create(email: 'example@mail.com', first_name: 'Example', last_name: 'Example') }

      before { delete :destroy, params: { id: user.id }, format: :json }

      it 'returns no content' do
        expect(response.status).to eq(204)
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq(user)
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
