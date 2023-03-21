# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/followings/index', type: :view do
  describe 'renders the index view of Users::FollowingsController' do
    it 'renders correctly' do
      paginate_users = PaginateUsers.new(user.followings, 1, '', cur_user)
      tab_presenter = UsersTabPresenter.new(User.all, :mock_name, paginate_users)
      assign(:tab_presenter, tab_presenter)

      sidebar_right_presenter = SidebarRightPresenter.new(user, cur_user)
      assign(:sidebar_right_presenter, sidebar_right_presenter)

      render

      expect_snapshot_match
      expect(rendered).to include('Users::Tabs::Component(tab_presenter: UsersTabPresenter, sidebar_right_presenter: SidebarRightPresenter)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
