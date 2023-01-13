require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:whiistle).class_name("BaseWhiistle").counter_cache(true) }
    it { should belong_to(:user) }
  end
end
