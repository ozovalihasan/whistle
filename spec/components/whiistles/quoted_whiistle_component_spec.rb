# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::QuotedWhiistleComponent, type: :component do
  it "renders correctly" do

    mock_components([
      Users::ProfileImageButtonSmallComponent, 
      Whiistles::UserNamesWithTimestampComponent, 
      Whiistles::BodyAndPicturesComponent, 
      Whiistles::FloodInfoComponent
    ])
    
    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
    quoting_whiistle = FactoryBot.create(:mock_quoting_whiistle)
    
    render_inline(described_class.new(whiistle: quoting_whiistle))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match "Users::ProfileImageButtonSmallComponent"
    expect(rendered_content).to match "Whiistles::UserNamesWithTimestampComponent"
    expect(rendered_content).to match "Whiistles::BodyAndPicturesComponent"
    expect(rendered_content).to match "Whiistles::FloodInfoComponent"
    
  end
end
