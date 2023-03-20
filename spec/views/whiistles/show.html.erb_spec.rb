require 'rails_helper'

RSpec.describe "whiistles/show", type: :view do
  
  describe "renders the show view of WhiistlesController" do
    let(:current_user_presenter) do
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    end

    let(:whiistle) do
      FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
    end

    let(:sidebar_right_presenter) { 
      SidebarRightPresenter.new(whiistle.user, current_user_presenter.current_user) 
    }

    it "renders correctly" do
      assign(:whiistle, whiistle)

      sidebar_right_presenter = SidebarRightPresenter.new(whiistle.user, current_user_presenter.current_user)
      assign(:sidebar_right_presenter, sidebar_right_presenter)
      
      assign(:current_user_presenter, current_user_presenter)

      render 

      expect_snapshot_match
      expect(rendered).to include("Whiistles::MainWhiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)")
      expect(rendered).to include("Users::SidebarRight::Component(sidebar_right_presenter: SidebarRightPresenter)")
      expect(rendered).to include("::Component").exactly(3).times
    end

    context "if whiistle has replies" do
      
      
      it "renders correctly" do
        
        FactoryBot.create(:mock_reply, whiistle: whiistle)
        assign(:whiistle, whiistle)

        sidebar_right_presenter = SidebarRightPresenter.new(whiistle.user, current_user_presenter.current_user)
        assign(:sidebar_right_presenter, sidebar_right_presenter)
        
        assign(:current_user_presenter, current_user_presenter)

        render 

        expect_snapshot_match("with_replies")
        expect(rendered).to include("Whiistles::MainWhiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)")
        expect(rendered).to include("Whiistles::ListWhiistles::Component(whiistles: ActiveRecord::Associations::CollectionProxy, current_user_presenter: CurrentUserPresenter)")
        expect(rendered).to include("Users::SidebarRight::Component(sidebar_right_presenter: SidebarRightPresenter)")
        expect(rendered).to include("::Component").exactly(4).times
      end
    end
  end

end
