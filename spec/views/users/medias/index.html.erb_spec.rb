# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/medias/index', type: :view do
  describe 'renders the index view of Users::MediasController' do
    it 'renders correctly' do
      paginate_whiistles = PaginateWhiistles.new(user.whiistles, 1, '', cur_user)
      paginate_whiistles.set_basic
      tab_presenter = WhiistlesTabPresenter.new(User.all, :mock_name, paginate_whiistles)
      assign(:tab_presenter, tab_presenter)

      sidebar_right_presenter = SidebarRightPresenter.new(user, cur_user)
      assign(:sidebar_right_presenter, sidebar_right_presenter)

      render

      expect_snapshot_match
      expect(rendered).to include('Users::Tabs::Component(tab_presenter: WhiistlesTabPresenter, sidebar_right_presenter: SidebarRightPresenter)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
