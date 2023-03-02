# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::UsersHavingRelationsComponent, type: :component do
  let(:user) do
    FactoryBot.create(:mock_user)
  end

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
        
      tab_presenter = UsersTabPresenter.new(user, :followers, paginated_users)

      
      render_inline(described_class.new(tab_presenter: tab_presenter))

      expect(rendered_content).to match_custom_snapshot('not_empty_users')  
      expect(rendered_content).to include "Users::PaginatedUsersComponent(paginated_users: PaginateUsers)"
    end
  end

  context "the paginated users is empty" do
    it "renders correctly" do

      mock_components([
        Users::PaginatedUsersComponent
      ])

      FactoryBot.create(:mock_user)
      
      cur_user = User.last
      page = 1
      url = "mock_url"
      original_empty_records = User.where(id: -1)
      paginated_users = PaginateUsers.new(original_empty_records, page, url, cur_user)
      tab_presenter = UsersTabPresenter.new(user, :followers, paginated_users)

      render_inline(described_class.new(tab_presenter: tab_presenter))

      expect(rendered_content).to match_custom_snapshot('empty_users')  
      expect(CGI::unescapeHTML rendered_content).to match "mock_fullname_2 doesn't have any follower."
    end
  end
end
