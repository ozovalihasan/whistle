# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistle do
  describe 'associations' do
    it { is_expected.to have_one(:flood).with_foreign_key('base_whiistle_id') }
  end

  describe 'instance methods' do
    describe '#leaf_flood' do
      it 'returns the last flood of floods' do
        create(:mock_user)
        whiistle = create(:mock_whiistle)
        flood1 = create(:mock_flood_of_same_user)
        flood2 = create(:mock_flood_of_same_user, whiistle: flood1)

        expect(whiistle.leaf_flood).to eq flood2
      end
    end

    describe '#count_floods' do
      it 'returns the last flood of floods' do
        create(:mock_user)
        whiistle = create(:mock_whiistle)
        flood1 = create(:mock_flood_of_same_user, whiistle:)
        flood2 = create(:mock_flood_of_same_user, whiistle: flood1)

        expect(whiistle.leaf_flood).to eq flood2
      end
    end
  end
end
