# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::PaginatedUsersComponent, type: :component do
  it "renders correctly" do

    mock_components([
      Shared::InfiniteScrollComponent,
      Shared::InfiniteScrollUsersComponent
    ])

    FactoryBot.create_list(:mock_user, 3)

    cur_user = User.last
    page = 1
    url = "mock_url"
    original_records = User.all.limit(2)
    paginated_users = PaginateUsers.new(original_records, page, url, cur_user)
      
    render_inline(described_class.new(paginated_users: User.all.limit(1)))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match "Shared::InfiniteScrollComponent"
    expect(rendered_content).to match "Shared::InfiniteScrollUsersComponent"
  end
end
