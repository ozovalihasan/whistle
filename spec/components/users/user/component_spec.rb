# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::User::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    user2 = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user: user, cur_user: user2))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Users::FollowButton::Component(user: User)"
    expect(rendered_content).to include "Users::ProfileImage::Component(user: User)"
    expect(rendered_content).to match("mock_fullname_1")
    expect(rendered_content).to match("mock_username_1")
    
  end
end
