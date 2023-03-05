# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::AddFollowing::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user_id: user.id))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to match(/button(.|\n)*bi-plus(.|\n)*button/)
  end
end
