require 'rails_helper'

RSpec.describe Reply, type: :model do
  describe 'associations' do
    it { should belong_to(:whiistle).class_name("BaseWhiistle").with_foreign_key("base_whiistle_id").counter_cache(true) }
  end
end
