require 'rails_helper'

RSpec.describe Wallet, type: :model do
  subject { Wallet.new }

  describe '#max_limit' do
    it 'returns zero' do
      expect(subject.max_limit).to eq(0)
    end
  end
end
