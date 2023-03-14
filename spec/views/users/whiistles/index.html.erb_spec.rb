require 'rails_helper'

RSpec.describe "users/whiistles/index", type: :view do
  
  describe "renders the index view of Users::WhiistlesController" do
  
    let(:user) {
      FactoryBot.create(:mock_user)
    }

    let(:current_user_presenter) { 
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    }
  
    it "renders correctly" do
    
      all_whiistles = Whiistle.all
      paginated_whiistles = PaginateWhiistles.new(all_whiistles, 1, '')

      whiistle = Whiistle.new

      tab_presenter = WhiistlesTabPresenter.new(user, :mock_name, paginated_whiistles, current_user_presenter, whiistle)
      assign(:tab_presenter, tab_presenter)

      sidebar_right_presenter = SidebarRightPresenter.new(user, current_user_presenter.current_user)
      assign(:sidebar_right_presenter, sidebar_right_presenter)

      render

      expect(rendered).to match_custom_snapshot
      expect(rendered).to include('Users::Tabs::Component(tab_presenter: WhiistlesTabPresenter, sidebar_right_presenter: SidebarRightPresenter)')

    end
  end

end
