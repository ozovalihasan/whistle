# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::DestroyRewhiistleButton::Component, type: :component do
  it 'renders correctly' do
    whiistle
    rewhiistle = create(:mock_rewhiistle)

    render_inline(described_class.new(rewhiistle:))

    expect_snapshot_match
    expect(rendered_content).to include 'method="post"'
    expect(rendered_content).to match(%r{action="/whiistles/\d+/rewhiistle/\d+"})
    expect(rendered_content).to include 'value="delete"'
    expect(rendered_content).to include 'Cancel rewhiistle'
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component(active: TrueClass)'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
