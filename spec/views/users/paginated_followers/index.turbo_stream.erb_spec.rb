# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/paginated_followers/index.turbo_stream' do
  describe 'renders the index(turbo_stream) view of Users::PaginatedFollowersController' do
    it 'renders Shared::ListUsers::Component' do
      paginate_users = PaginateUsers.new(user.followers, 1, '', cur_user)
      assign(:paginate_users, paginate_users)

      render

      expect_snapshot_match
      expect(rendered).to include('turbo-stream action="append" target="pagination-body"')
      expect(rendered).to include('Shared::ListUsers::Component(paginate_users: PaginateUsers)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
