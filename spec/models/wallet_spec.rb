require 'rails_helper'

RSpec.describe Wallet, type: :model do
  subject { Wallet.new }

  describe '#maximum_limit' do
    it 'returns zero' do
      expect(subject.maximum_limit).to eq(0)
    end
  end
end
