# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::CreateRewhiistleButton::Component, type: :component do
  it "renders correctly" do

    FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)
    
    render_inline(described_class.new(whiistle: whiistle))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include "button"
    expect(rendered_content).to include "bi-repeat"
    expect(rendered_content).to include "Rewhiistle"
    expect(rendered_content).to match /action="\/whiistles\/\d+\/rewhiistle"/
    expect(rendered_content).to include "Whiistles::ButtonInner::Component()"
  end
end
