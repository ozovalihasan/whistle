# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::CreateLikeButton::Component, type: :component do
  it "renders correctly" do
    FactoryBot.create_list(:mock_user, 3)
    whiistle = FactoryBot.create(:mock_whiistle)
    FactoryBot.create_list(:mock_like, 2, whiistle: whiistle)
    
    render_inline(described_class.new(whiistle: whiistle))

    expect_snapshot_match  
    expect(rendered_content).to match /form.*method="post".*action="\/whiistles\/\d+\/likes"/
    expect(rendered_content).to include "bi-heart"
    expect(rendered_content).to include "<span>2</span>"
    expect(rendered_content).to include "Whiistles::ButtonInner::Component()"
    
  end
end
