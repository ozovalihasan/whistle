# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::QuotedWhiistleButton::Component, type: :component do
  it "renders correctly" do

    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
    
    render_inline(described_class.new(whiistle: Whiistle.first))

    expect_snapshot_match
    expect(rendered_content).to match "Quoted Whiistle"
    expect(rendered_content).to match /data-turbo-frame="quoting_whiistle_whiistle_\d+/
    expect(rendered_content).to match /href="\/whiistles\/\d+\/quoted_whiistle\/new"/
    expect(rendered_content).to include "Whiistles::ButtonInner::Component()"
    expect(rendered_content).to include("::Component").exactly(1).times
  end
end
