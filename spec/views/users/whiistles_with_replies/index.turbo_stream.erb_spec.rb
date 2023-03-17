require 'rails_helper'

RSpec.describe "users/whiistles_with_replies/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::WhiistlesWithRepliesController" do
    let(:cur_user) do
      FactoryBot.create(:mock_user)
    end

    let(:user) do
      FactoryBot.create(:mock_user)
    end

    it "renders correctly" do
      paginate_whiistles = PaginateWhiistles.new(user.liked_whiistles, 1, "", cur_user)
      paginate_whiistles.set_connected
      assign(:paginate_whiistles, paginate_whiistles)

      render

      expect_snapshot_match
      expect(rendered).to include('action="append" target="pagination-body"')  
      expect(rendered).to include('Whiistles::ListPaginatedWhiistles::Component(paginate_whiistles: PaginateWhiistles)') 
    end
  end

end
