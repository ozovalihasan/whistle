# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FloodInfo::Component, type: :component do
  before(:each) do
    FactoryBot.reload
  end

  context 'if a whiistle has a flood' do
    it "renders 'Show this thread' link " do
      FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      FactoryBot.create(:mock_flood)
      
      render_inline(described_class.new(whiistle: whiistle))

      expect_snapshot_match("with_whiistle")  
      expect(rendered_content).to include "Show this thread"
    end
  end

  context 'if a whiistle is a Flood' do
    it "renders 'Show this thread' link " do
      FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      flood = FactoryBot.create(:mock_flood)
      
      render_inline(described_class.new(whiistle: flood))

      expect_snapshot_match("with_whiistle_as_Flood")  
      expect(rendered_content).to include "Show this thread"
    end
  end
end
