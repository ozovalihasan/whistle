# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::CreateLikeButton::Component, type: :component do
  it 'renders correctly' do
    create_list(:mock_user, 2)
    create_list(:mock_like, 2, whiistle:)

    render_inline(described_class.new(whiistle:))

    expect_snapshot_match
    expect(rendered_content).to match(%r{form.*method="post".*action="/whiistles/\d+/likes"})
    expect(rendered_content).to include 'bi-heart'
    expect(rendered_content).to include '<span>2</span>'
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component()'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
