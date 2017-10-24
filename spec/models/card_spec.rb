require 'rails_helper'

RSpec.describe Card, type: :model do
  subject { Card.new(number: '4444444444444444', real_limit: 100, spent_value: 50) }

  describe '#float_limit' do
    it 'returns the float limit' do
      subject.valid?
      expect(subject.float_limit).to eq(50)
    end
  end

  describe '#truncate_number' do
    it 'returns the truncate card number' do
      expect(subject.truncate_number).to eq('************4444')
    end
  end
end
