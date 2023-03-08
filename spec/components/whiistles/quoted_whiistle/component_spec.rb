# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::QuotedWhiistle::Component, type: :component do
  it "renders correctly" do

    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
    quoting_whiistle = FactoryBot.create(:mock_quoting_whiistle)
    
    render_inline(described_class.new(whiistle: quoting_whiistle))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match "Users::ProfileImageButtonSmall::Component"
    expect(rendered_content).to match "Whiistles::UserNamesWithTimestamp::Component"
    expect(rendered_content).to match "Whiistles::BodyAndPictures::Component"
    expect(rendered_content).to match "Whiistles::FloodInfo::Component"
    
  end
end
