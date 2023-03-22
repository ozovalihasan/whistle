# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ReplyInfo::Component, type: :component do
  context 'if whiistle is a reply' do
    it 'renders correctly' do
      reply = create(:mock_reply, whiistle:)

      render_inline(described_class.new(whiistle: reply))

      expect_snapshot_match
      expect(rendered_content).to match 'Replying to'
      expect(rendered_content).to match '@mock_username_1'
    end
  end

  context 'if whiistle is not a reply' do
    it "doesn't render" do
      render_inline(described_class.new(whiistle:))

      expect(rendered_content).to be_empty
    end
  end
end
