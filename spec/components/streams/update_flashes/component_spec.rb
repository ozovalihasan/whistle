# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Streams::UpdateFlashes::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(alert: 'mock_alert', notice: 'mock_notice'))

    expect_snapshot_match
    expect(rendered_content).to include("Layout::Flash::Component(message: String)")
    expect(rendered_content).to include("Layout::Flash::Component(message: String, alert: TrueClass)")
    expect(rendered_content).to match(/turbo-stream/)
    expect(rendered_content).to match(/action="prepend"/)
    expect(rendered_content).to include('::Component').exactly(2).times
  end
end
