require 'rails_helper'

RSpec.describe "users/whiistles/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::WhiistlesController" do
    let(:current_user_presenter) { 
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    }
  
    it "renders correctly" do
    
      all_whiistles = Whiistle.all
      
      paginated_whiistles = PaginateWhiistles.new(all_whiistles, 1, '')
      paginated_whiistles.set_connected
      assign(:paginated_whiistles, paginated_whiistles)

      assign(:current_user_presenter, current_user_presenter)

      render

      expect(rendered).to match_custom_snapshot
      expect(rendered).to include('Whiistles::ListWhiistlesWithRelatedWhiistles::Component(whiistles: ActiveRecord::Relation, current_user_presenter: CurrentUserPresenter)')
      expect(rendered).to include('turbo-stream action="append" target="pagination-body"')

    end
  end

end
