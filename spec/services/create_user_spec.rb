require 'rails_helper'

RSpec.describe CreateUser do
  subject { CreateUser.call(user_params) }

  describe '#call' do
    context 'when it suceed' do
      let(:user_params) { { email: 'example@mail.com', first_name: 'Example', last_name: 'Example' } }

      it 'creates a user' do
        expect(subject.persisted?).to be(true)
      end

      it 'creates a wallet' do
        expect(subject.wallet.persisted?).to be(true)
      end
    end

    context 'when it fails' do
      let(:user_params) { { email: '', first_name: '', last_name: '' } }

      it 'not create a user' do
        expect(subject.persisted?).to be(false)
      end

      it 'not create a wallet' do
        expect(subject.wallet.persisted?).to be(false)
      end
    end
  end
end
