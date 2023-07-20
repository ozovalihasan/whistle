# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::WhiistleWithFloodInfo::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(whiistle:, current_user_presenter:))

    expect_snapshot_match
    expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter, show_flood_info: TrueClass)'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
