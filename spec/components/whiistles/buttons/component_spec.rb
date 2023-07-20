# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::Buttons::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(whiistle:, current_user_presenter:))

    expect_snapshot_match
    expect(rendered_content).to include 'Whiistles::ReplyButton::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::ToggleRewhiistleOrQuoteButton::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include 'Whiistles::LikeButton::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include('::Component').exactly(3).times
    expect(rendered_content).to match(/id.*reply_whiistle_\d+/)
    expect(rendered_content).to match(/id.*quoting_whiistle_whiistle_\d+/)
  end
end
