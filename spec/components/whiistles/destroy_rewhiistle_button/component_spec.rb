# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::DestroyRewhiistleButton::Component, type: :component do
  before(:each) do
    mock_components([
      Whiistles::ButtonInner::Component
    ])
  end
  
  it "renders correctly" do

    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
    rewhiistle = FactoryBot.create(:mock_rewhiistle)
    
    render_inline(described_class.new(rewhiistle: rewhiistle))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include 'method="post"'
    expect(rendered_content).to match /action="\/whiistles\/\d+\/rewhiistle\/\d+"/
    expect(rendered_content).to include 'value="delete"'
    expect(rendered_content).to include 'Cancel rewhiistle'
    expect(rendered_content).to include "Whiistles::ButtonInner::Component"
  end
end
