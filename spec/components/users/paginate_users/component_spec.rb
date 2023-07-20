# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::PaginateUsers::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(paginate_users: User.all))

    expect_snapshot_match
    expect(rendered_content).to match 'Shared::InfiniteScroll::Component'
    expect(rendered_content).to match 'Shared::ListUsers::Component'
  end
end
