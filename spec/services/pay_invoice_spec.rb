require 'rails_helper'

RSpec.describe PayInvoice do
  subject { PayInvoice.call(card, 50) }

  let(:card) { create(:card) }

  describe '#call' do
    context 'when given value is bigger than spent_value' do
      it 'returns false' do
        expect(subject).to be(false)
      end
    end

    context 'when given value is lower or equal to spent_value' do
      before { card.update_attribute(:spent_value, 100) }

      it 'returns true' do
        expect(subject).to be(true)
      end

      it 'substract value from spent_value' do
        subject
        expect(card.reload.spent_value.to_f).to eq(50.0)
      end
    end
  end
end
