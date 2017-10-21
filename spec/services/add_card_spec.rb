require 'rails_helper'

RSpec.describe AddCard do
  subject { AddCard.call(user, card_params) }

  let(:user) { create(:wallet).user }

  describe '#call' do
    context 'when it suceed' do
      let(:card_params) { attributes_for(:card) }

      it 'creates a card' do
        expect { subject }.to change { Card.count }.by(1)
      end
    end

    context 'when it fails' do
      let(:card_params) { {} }

      it 'not create a card' do
        expect { subject }.to change { Card.count }.by(0)
      end
    end
  end
end
