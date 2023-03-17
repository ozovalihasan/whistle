# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileImageButtonSmall::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user: user))

    expect_snapshot_match  
    expect(rendered_content).to include("Users::ProfileImageButton::Component(user: User, size: Symbol)")
    expect(rendered_content).to include("::Component").exactly(1).times
  end  

  
end
