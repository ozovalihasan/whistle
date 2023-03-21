# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shared::ListUsers::Component, type: :component do
  it 'renders paginated users correctly' do
    user = FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_user)

    paginate_users = PaginateUsers.new(User.all, nil, nil, user)

    render_inline(described_class.new(paginate_users:))

    expect_snapshot_match
    expect(rendered_content).to include 'Users::User::Component(ActiveRecord::Relation, cur_user: User)'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
