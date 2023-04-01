# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Layout::LeftSide::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(current_user: cur_user))

    expect_snapshot_match
    expect(rendered_content).to include('<turbo-frame id="cur-user-left-side" target="user-content">')
    expect(rendered_content).to match(/Followers/)
    expect(rendered_content).to match(/Following/)
    expect(rendered_content).to match(/HOME/)
    expect(rendered_content).to match(/CONNECT/)
    expect(rendered_content).to match(/DISCOVER/)
    expect(rendered_content).to match(/PROFILE/)
    expect(rendered_content).to match(/STATISTICS/)
  end
end
