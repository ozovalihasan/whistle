require 'rails_helper'

RSpec.describe Whiistle, type: :model do
  describe 'Associations' do
    it { should validate_length_of(:body).is_at_least(3) }

    it { should belong_to(:user) }
  end
end
