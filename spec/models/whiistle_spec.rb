require 'rails_helper'

RSpec.describe Whiistle, type: :model do
  describe 'associations' do
    it { should have_one(:flood).with_foreign_key("base_whiistle_id") }
  end

  describe 'instance methods' do
    
    describe '#leaf_flood' do
      it 'returns the last flood of floods' do
        FactoryBot.create(:mock_user)
        whiistle = FactoryBot.create(:mock_whiistle)
        flood1 = FactoryBot.create(:mock_flood_of_same_user)
        flood2 = FactoryBot.create(:mock_flood_of_same_user, whiistle: flood1)

        expect(whiistle.leaf_flood).to eq flood2
      end
    end  

    describe '#count_floods' do
      it 'returns the last flood of floods' do
        FactoryBot.create(:mock_user)
        whiistle = FactoryBot.create(:mock_whiistle)
        flood1 = FactoryBot.create(:mock_flood_of_same_user, whiistle: whiistle)
        flood2 = FactoryBot.create(:mock_flood_of_same_user, whiistle: flood1)

        expect(whiistle.leaf_flood).to eq flood2
      end
    end  
  end
end
