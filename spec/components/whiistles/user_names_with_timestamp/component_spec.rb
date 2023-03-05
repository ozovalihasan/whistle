# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::UserNamesWithTimestamp::Component, type: :component do
  it "renders correctly" do

    FactoryBot.create(:mock_user)
    whiistle = nil

    travel_to(Time.new(2000, 1, 1, 1, 1, 1)) do
      whiistle = FactoryBot.create(:mock_whiistle)
    end
    
    travel_to(Time.new(2001, 1, 1, 1, 1, 1)) do
      render_inline(described_class.new(whiistle: whiistle))
    end

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to match /mock_fullname_\d*/
    expect(rendered_content).to match /@mock_username_\d*/
    expect(rendered_content).to match /a.*href.*"\/whiistles\/\d+"/
    expect(rendered_content).to include "1y"
  end
end
