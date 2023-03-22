# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flood do
  describe 'associations' do
    it { is_expected.to have_one(:flood).with_foreign_key('base_whiistle_id') }

    it {
      expect(subject).to belong_to(:whiistle).class_name('BaseWhiistle').with_foreign_key('base_whiistle_id').counter_cache(:replies_count)
    }
  end
end
