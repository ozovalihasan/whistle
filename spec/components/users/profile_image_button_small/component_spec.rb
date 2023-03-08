# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileImageButtonSmall::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user: user))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include("Users::ProfileImageButton::Component(user: User, size: Symbol)")

  end  

  
end
