require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'example@mail.com', first_name: 'Example', last_name: 'Example') }

  describe '#full_name' do
    it 'returns the full name' do
      expect(subject.full_name).to eq('Example Example')
    end
  end
end
