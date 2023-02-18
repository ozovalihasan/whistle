# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::UsersHavingRelationsComponent, type: :component do
  context "the paginated users is not empty" do
    it "renders correctly" do

      mock_components([
        Users::PaginatedUsersComponent
      ])

      FactoryBot.create_list(:mock_user, 3)

      cur_user = User.last
      page = 1
      url = "mock_url"
      original_records = User.all.limit(2)
      paginated_users = PaginateUsers.new(original_records, page, url, cur_user)
        
      tab_presenter = double("tab_presenter")
      
      render_inline(described_class.new(paginated_users: paginated_users, tab_presenter: tab_presenter))

      expect(rendered_content).to match_snapshot('UsersHavingRelationsComponent_not_empty_users')  
      expect(rendered_content).to include "Users::PaginatedUsersComponent(paginated_users: PaginateUsers)"
    end
  end

  context "the paginated users is empty" do
    it "renders correctly" do

      mock_components([
        Users::PaginatedUsersComponent
      ])

      FactoryBot.create(:mock_user)
      
      paginated_users = double("paginated_users", record_exist?: false)
      tab_presenter = double("tab_presenter", no_user_info: "mock_no_user_info")
      
      render_inline(described_class.new(paginated_users: paginated_users, tab_presenter: tab_presenter))

      expect(rendered_content).to match_snapshot('UsersHavingRelationsComponent_empty_users')  
      expect(rendered_content).to match "mock_no_user_info"
    end
  end
end
