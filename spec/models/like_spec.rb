# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like do
  describe 'associations' do
    it { is_expected.to belong_to(:whiistle).class_name('BaseWhiistle').counter_cache(true) }
    it { is_expected.to belong_to(:user) }
  end
end
