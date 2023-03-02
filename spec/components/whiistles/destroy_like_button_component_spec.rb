# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::DestroyLikeButtonComponent, type: :component do
  
  it "renders correctly" do

    mock_components([
      Streams::EnterLeaveAnimationComponent
    ])

    FactoryBot.create_list(:mock_user, 2)
    whiistle = FactoryBot.create(:mock_whiistle)
    FactoryBot.create_list(:mock_like, 2, whiistle: whiistle)
    
    render_inline(described_class.new(like: Like.first))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include "Streams::EnterLeaveAnimationComponent"
    expect(rendered_content).to match /action="\/whiistles\/\d+\/likes\/\d+"/
    expect(rendered_content).to include 'value="delete"'
    
  end
end
