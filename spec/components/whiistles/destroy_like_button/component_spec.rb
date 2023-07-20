# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::DestroyLikeButton::Component, type: :component do
  it 'renders correctly' do
    create(:mock_like, whiistle:)

    render_inline(described_class.new(like: Like.first))

    expect_snapshot_match
    expect(rendered_content).to match(%r{action="/whiistles/\d+/likes/\d+"})
    expect(rendered_content).to include 'value="delete"'
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component(active: TrueClass)'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
