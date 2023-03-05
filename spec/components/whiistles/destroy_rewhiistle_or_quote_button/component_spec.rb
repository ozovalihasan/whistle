# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::DestroyRewhiistleOrQuoteButton::Component, type: :component do
  it "renders correctly" do

    FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)
    whiistle.update(rewhiistles_count: 111, quoting_whiistles_count: 222)
    
    render_inline(described_class.new(whiistle: whiistle).with_variant(:phone))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match "333"
  end
end
