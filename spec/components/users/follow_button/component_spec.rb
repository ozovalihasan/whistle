# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::FollowButton::Component, type: :component do
  it "renders a follow button" do

    user = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user: user))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match(/form(.|\n)*Follow(.|\n)*form/)

  end
end