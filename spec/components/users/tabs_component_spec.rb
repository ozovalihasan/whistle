# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::TabsComponent, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Users::TabsButtonComponent,
      Users::SidebarRightComponent,
      Users::WhiistlesTabComponent,
      Users::UsersHavingRelationsComponent
    ])
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:cur_user) do
    FactoryBot.create(:mock_user)
  end

  let(:expect_mandatory_elements) do
    expect(rendered_content).to include('<turbo-frame data-turbo-action="advance" id="user_tabs">')
    expect(rendered_content).to include("Users::TabsButtonComponent(url: String, text: String, active_tab: TrueClass)").exactly(1).times
    expect(rendered_content).to include("Users::TabsButtonComponent(url: String, text: String, active_tab: FalseClass)").exactly(5).times
    expect(rendered_content).to include("Users::SidebarRightComponent(sidebar_right_presenter: SidebarRightPresenter)")
    expect(rendered_content).to include('<div class="w-2/3">')
    expect(rendered_content).to include('<div class="w-1/3">')
  end

  context "if the tab shows whiistles" do
    it "renders correctly" do
      
      paginated_whiistles = PaginateWhiistles.new(Whiistle.all, 1, "mock_url")
      current_user_presenter = CurrentUserPresenter.new(cur_user)

      tab_presenter = WhiistlesTabPresenter.new(user, :whiistles_without_replies, paginated_whiistles, current_user_presenter, Whiistle.new)
      sidebar_right_presenter = SidebarRightPresenter.new(user, cur_user)
      
      render_inline(described_class.new(
        tab_presenter: tab_presenter, 
        sidebar_right_presenter: sidebar_right_presenter
      ))

      expect(rendered_content).to match_snapshot('TabsComponent_with_whiistles')
      expect_mandatory_elements
      expect(rendered_content).to include("Users::WhiistlesTabComponent(tab_presenter: WhiistlesTabPresenter)")
    end
  end

  context "if the tab shows users" do
    it "renders correctly" do
      
      paginated_users = PaginateUsers.new(User.all.limit(0), 1, "mock_url", cur_user)
      tab_presenter = UsersTabPresenter.new(user, :followers, paginated_users)
      
      sidebar_right_presenter = SidebarRightPresenter.new(user, cur_user)
      
      current_user_presenter = CurrentUserPresenter.new(cur_user)
      
      render_inline(described_class.new(
        tab_presenter: tab_presenter, 
        sidebar_right_presenter: sidebar_right_presenter
      ))

      expect(rendered_content).to match_snapshot('TabsComponent_with_users')
      expect_mandatory_elements
      expect(rendered_content).to include("Users::UsersHavingRelationsComponent(tab_presenter: UsersTabPresenter)")
    end
  end
end
