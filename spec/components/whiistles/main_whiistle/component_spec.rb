# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::MainWhiistle::Component, type: :component do
  it 'renders correctly' do
    travel_to(Time.zone.local(2000, 1, 1, 1, 1, 1)) do
      whiistle
    end

    travel_to(Time.zone.local(2001, 1, 1, 1, 1, 1)) do
      render_inline(described_class.new(whiistle:, current_user_presenter:))
    end

    expect_snapshot_match
    expect(rendered_content).to include 'Users::ProfileImageButton::Component(user: User)'
    expect(rendered_content).to include 'Whiistles::UserNamesVertical::Component(user: User)'
    expect(rendered_content).to include 'Whiistles::ReplyInfo::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::BodyAndPictures::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::Buttons::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include('::Component').exactly(5).times
  end
end
