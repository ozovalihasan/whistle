require 'rails_helper'

RSpec.describe "whiistles/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of WhiistlesController" do
    let(:cur_user) { 
       FactoryBot.create(:mock_user)
    }
  
    it "renders correctly" do
      paginate_whiistles = PaginateWhiistles.new(cur_user.main_page_whiistles, 1, '', cur_user)
      paginate_whiistles.set_connected
      assign(:paginate_whiistles, paginate_whiistles)

      render

      expect_snapshot_match
      expect(rendered).to include('action="append" target="pagination-body"')
      expect(rendered).to include('Whiistles::ListPaginatedWhiistles::Component(paginate_whiistles: PaginateWhiistles)')

    end
  end

end
