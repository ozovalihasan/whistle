# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ListWhiistles::Component, type: :component do
  it 'renders correctly' do
    FactoryBot.create(:mock_whiistle, user:)
    FactoryBot.create(:mock_flood, user:)
    FactoryBot.create(:mock_reply, user:)

    whiistles = BaseWhiistle.all
    render_inline(described_class.new(whiistles:, current_user_presenter:))

    expect_snapshot_match
    expect(rendered_content).to include 'Whiistles::WhiistleWithFloodInfo::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include 'Whiistles::WhiistleWithFloodInfo::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include 'Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include('::Component').exactly(6).times
  end
end
