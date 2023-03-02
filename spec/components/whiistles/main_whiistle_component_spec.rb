# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::MainWhiistleComponent, type: :component do
  it "renders correctly" do

    mock_components([
      Users::ProfileImageButtonComponent,
      Whiistles::UserNamesVerticalComponent,
      Whiistles::ReplyInfoComponent,
      Whiistles::BodyAndPicturesComponent,
      Whiistles::ButtonsComponent
    ])

    user = FactoryBot.create(:mock_user)
    cur_user = FactoryBot.create(:mock_user)
    current_user_presenter = CurrentUserPresenter.new(user)

    whiistle = nil
    travel_to(Time.utc(2001, 1, 1, 1, 1, 1)) do
      whiistle = FactoryBot.create(:mock_whiistle)
    end
    
    render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Users::ProfileImageButtonComponent"
    expect(rendered_content).to include "Whiistles::UserNamesVerticalComponent"
    expect(rendered_content).to include "Whiistles::ReplyInfoComponent"
    expect(rendered_content).to include "Whiistles::BodyAndPicturesComponent"
    expect(rendered_content).to include "Whiistles::ButtonsComponent"
  end
end
