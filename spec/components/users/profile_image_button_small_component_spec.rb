# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileImageButtonSmallComponent, type: :component do
  before(:all) {
    mock_components([Users::ProfileImageButtonComponent])
  }
  
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user: user))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include("Users::ProfileImageButtonComponent(user: User, size: Symbol)")

  end  

  
end
