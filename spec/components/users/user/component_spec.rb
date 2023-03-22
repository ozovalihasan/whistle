# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::User::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(user:, cur_user:))

    expect_snapshot_match
    expect(rendered_content).to include 'Users::ProfileImage::Component(user: User)'
    expect(rendered_content).to include 'Users::FollowButton::Component(user: User)'
    expect(rendered_content).to include('::Component').exactly(2).times
    expect(rendered_content).to match('mock_fullname_1')
    expect(rendered_content).to match('mock_username_1')
  end
end
