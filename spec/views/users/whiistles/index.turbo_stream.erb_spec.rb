# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/whiistles/index.turbo_stream' do
  describe 'renders the index(turbo_stream) view of Users::WhiistlesController' do
    it 'renders correctly' do
      paginate_whiistles = PaginateWhiistles.new(user.whiistles, 1, '', cur_user)
      paginate_whiistles.set_connected
      assign(:paginate_whiistles, paginate_whiistles)

      render

      expect_snapshot_match
      expect(rendered).to include('action="append" target="pagination-body"')
      expect(rendered).to include('Whiistles::ListPaginatedWhiistles::Component(paginate_whiistles: PaginateWhiistles)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
