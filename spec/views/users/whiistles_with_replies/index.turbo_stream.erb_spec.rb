require 'rails_helper'

RSpec.describe "users/whiistles_with_replies/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::WhiistlesWithRepliesController" do
    let(:current_user_presenter) { 
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    }
  
    it "renders correctly" do
    
      all_whiistles = Whiistle.all
      
      paginate_whiistles = PaginateWhiistles.new(all_whiistles, 1, '')
      paginate_whiistles.set_connected
      assign(:paginate_whiistles, paginate_whiistles)

      assign(:current_user_presenter, current_user_presenter)

      render

      expect_snapshot_match
      expect(rendered).to include('Whiistles::ListWhiistlesWithRelatedWhiistles::Component(whiistles: ActiveRecord::Relation, current_user_presenter: CurrentUserPresenter)')
      expect(rendered).to include('turbo-stream action="append" target="pagination-body"')

    end
  end

end
