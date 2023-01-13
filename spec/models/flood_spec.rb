require 'rails_helper'

RSpec.describe Flood, type: :model do
  describe 'associations' do
    it { should have_one(:flood).with_foreign_key("base_whiistle_id") }
    it { should belong_to(:whiistle).class_name("BaseWhiistle").with_foreign_key("base_whiistle_id").counter_cache(:replies_count) }
  end
end
