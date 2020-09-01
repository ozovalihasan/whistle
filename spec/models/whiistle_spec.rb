require 'rails_helper'

RSpec.describe Whiistle, type: :model do
  describe 'validations' do
    it {
      should validate_length_of(:body).is_at_least(3)
        .with_message('of your whiistle cannot be shorter than 3 letters')
    }
  end
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
