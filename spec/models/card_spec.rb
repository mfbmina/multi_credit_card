require 'rails_helper'

RSpec.describe Card, type: :model do
  subject { Card.new(number: '4444444444444444') }

  describe '#truncate_number' do
    it 'returns the truncate card number' do
      expect(subject.truncate_number).to eq('************4444')
    end
  end
end
