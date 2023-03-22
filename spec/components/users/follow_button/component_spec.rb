# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::FollowButton::Component, type: :component do
  it 'renders a follow button' do
    render_inline(described_class.new(user:))

    expect_snapshot_match
    expect(rendered_content).to match(/form(.|\n)*Follow(.|\n)*form/)
  end
end
