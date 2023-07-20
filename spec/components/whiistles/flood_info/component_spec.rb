# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::FloodInfo::Component, type: :component do
  context 'if a whiistle has a flood' do
    it "renders 'Show this thread' link" do
      create(:mock_flood, whiistle:)

      render_inline(described_class.new(whiistle:))

      expect_snapshot_match('with_whiistle')
      expect(rendered_content).to include 'Show this thread'
    end
  end

  context 'if a whiistle is a Flood' do
    it "renders 'Show this thread' link" do
      flood = create(:mock_flood, whiistle:)

      render_inline(described_class.new(whiistle: flood))

      expect_snapshot_match('with_whiistle_as_Flood')
      expect(rendered_content).to include 'Show this thread'
    end
  end
end
