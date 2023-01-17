require 'rails_helper'

RSpec.describe Rewhiistle, type: :model do
  describe 'validates' do
    it 'raises an error if there is whiistle created with the same user and whiistle' do
      user = FactoryBot.create :mock_user 
      whiistle = FactoryBot.create :mock_whiistle
      FactoryBot.create :mock_rewhiistle, user: user, whiistle: whiistle
      rewhiistle2 = FactoryBot.build :mock_rewhiistle, user: user, whiistle: whiistle
      
      expect(rewhiistle2.valid?).to be false
    end
  end

  describe 'associations' do
    it { should belong_to(:whiistle).class_name("BaseWhiistle").counter_cache(:true) }
    it { should belong_to(:user).counter_cache(:true) }
  end
end