# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::WhiistleWithFloodInfo::Component, type: :component do
  
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)
    
    current_user_presenter = CurrentUserPresenter.new(user)

    render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

    expect_snapshot_match
    expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter, show_flood_info: TrueClass)"
  end
end
