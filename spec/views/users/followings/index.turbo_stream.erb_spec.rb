require 'rails_helper'

RSpec.describe "users/followings/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::FollowingsController" do
    it "renders Shared::InfiniteScrollUsers::Component" do
      FactoryBot.create_pair(:mock_user)
      followings = User.all
      paginated_users = PaginateUsers.new(followings, 1, "", nil)
      
      assign(:paginated_users, paginated_users)

      render

      expect(rendered).to match_snapshot('index_turbo_stream')
      expect(rendered).to include('turbo-stream action="append" target="pagination-body"')
      expect(rendered).to include('Shared::InfiniteScrollUsers::Component(paginated_users: PaginateUsers)')

    end
  end

end
