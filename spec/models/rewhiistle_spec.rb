# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rewhiistle do
  describe 'validates' do
    it 'raises an error if there is whiistle created with the same user and whiistle' do
      user = create(:mock_user)
      whiistle = create(:mock_whiistle)
      create(:mock_rewhiistle, user:, whiistle:)
      rewhiistle2 = build(:mock_rewhiistle, user:, whiistle:)

      expect(rewhiistle2.valid?).to be false
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:whiistle).class_name('BaseWhiistle').counter_cache(true) }
    it { is_expected.to belong_to(:user).counter_cache(true) }
  end
end
