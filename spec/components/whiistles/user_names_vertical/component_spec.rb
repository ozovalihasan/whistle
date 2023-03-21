# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::UserNamesVertical::Component, type: :component do
  it 'renders correctly' do
    user = FactoryBot.create(:mock_user)

    render_inline(described_class.new(user:))

    expect_snapshot_match
    expect(rendered_content).to match 'mock_fullname_1'
    expect(rendered_content).to match 'mock_username_1'
  end
end
