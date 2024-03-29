# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ReplyButton::Component, type: :component do
  it "renders 'Show this thread' link" do
    whiistle
    create(:mock_reply)
    whiistle.reload

    render_inline(described_class.new(whiistle:))

    expect_snapshot_match
    expect(rendered_content).to include 'modal#openAndVisit'
    expect(rendered_content).to match(%r{<a (.|\n)*1(.|\n)*</a>})
    expect(rendered_content).to match(/reply_counter_whiistle_\d+/)
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component()'
    expect(rendered_content).to include 'Whiistles::ButtonContainer::Component()'
    expect(rendered_content).to include('::Component').exactly(2).times
  end
end
