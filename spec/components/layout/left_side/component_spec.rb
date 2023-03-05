# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::LeftSide::Component, type: :component do
  it "renders correctly" do

    current_user = FactoryBot.create(:mock_user)
    
    render_inline( described_class.new(current_user: current_user) )

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match(/Followers/)
    expect(rendered_content).to match(/Followings/)
    expect(rendered_content).to match(/HOME/)
    expect(rendered_content).to match(/CONNECT/)
    expect(rendered_content).to match(/DISCOVER/)
    expect(rendered_content).to match(/PROFILE/)
    expect(rendered_content).to match(/STATISTICS/)
  end
end


