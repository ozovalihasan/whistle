# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/index' do
  describe 'renders the index view of WhiistlesController' do
    it 'renders correctly' do
      paginate_whiistles = PaginateWhiistles.new(cur_user.main_page_whiistles, 1, '', cur_user)
      paginate_whiistles.set_connected
      assign(:paginate_whiistles, paginate_whiistles)

      whiistle = Whiistle.new
      assign(:whiistle, whiistle)

      suggested_users = cur_user.suggested_users.with_current_user_situation(cur_user)
      assign(:suggested_users, suggested_users)

      sign_in cur_user

      render

      expect_snapshot_match
      expect(rendered).to include('Whiistles::FormOpeningModal::Component(label: String, whiistle: Whiistle, path: String, cur_user: User)')
      expect(rendered).to include('Whiistles::WhiistlesCounter::Component(whiistles_count: Integer)')
      expect(rendered).to include('Shared::InfiniteScroll::Component(paginate_records: PaginateWhiistles)')
      expect(rendered).to include('Whiistles::ListPaginatedWhiistles::Component(paginate_whiistles: PaginateWhiistles)')
      expect(rendered).to include('Users::User::Component(ActiveRecord::Relation)')
      expect(rendered).to include('::Component').exactly(5).times
    end
  end
end
