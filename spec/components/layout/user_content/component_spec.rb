# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Layout::UserContent::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new) { 'mock_content' }

    expect_snapshot_match
    expect(rendered_content).to include('<turbo-frame data-turbo-action="advance" id="user-content">')
    expect(rendered_content).to match(/mock_content/)
    expect(rendered_content).not_to include('::Component')
  end
end
