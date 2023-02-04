# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::AddFollowingComponent, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    
    render_inline(described_class.new(user: user))

    expect(rendered_content).to match_snapshot('AddFollowingComponent')  
    expect(rendered_content).to match(/button(.|\n)*bi-plus(.|\n)*button/)
  end
end
