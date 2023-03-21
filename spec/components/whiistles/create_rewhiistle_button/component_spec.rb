# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::CreateRewhiistleButton::Component, type: :component do
  it 'renders correctly' do
    FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)

    render_inline(described_class.new(whiistle:))

    expect_snapshot_match
    expect(rendered_content).to include 'button'
    expect(rendered_content).to include 'bi-repeat'
    expect(rendered_content).to include 'Rewhiistle'
    expect(rendered_content).to match(%r{action="/whiistles/\d+/rewhiistle"})
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component()'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
