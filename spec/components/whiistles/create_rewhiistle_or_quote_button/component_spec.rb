# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::CreateRewhiistleOrQuoteButton::Component, type: :component do
  it 'renders correctly' do
    FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)
    whiistle.update(rewhiistles_count: 111, quoting_whiistles_count: 222)

    render_inline(described_class.new(whiistle:).with_variant(:phone))

    expect_snapshot_match
    expect(rendered_content).to include '333'
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component()'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
