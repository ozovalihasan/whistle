# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::MainWhiistle::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    cur_user = FactoryBot.create(:mock_user)
    current_user_presenter = CurrentUserPresenter.new(user)

    whiistle = nil
    travel_to(Time.utc(2001, 1, 1, 1, 1, 1)) do
      whiistle = FactoryBot.create(:mock_whiistle)
    end
    
    render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Users::ProfileImageButton::Component"
    expect(rendered_content).to include "Whiistles::UserNamesVertical::Component"
    expect(rendered_content).to include "Whiistles::ReplyInfo::Component"
    expect(rendered_content).to include "Whiistles::BodyAndPictures::Component"
    expect(rendered_content).to include "Whiistles::Buttons::Component"
  end
end
