# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::PaginateUsers::Component, type: :component do
  it "renders correctly" do

    FactoryBot.create_list(:mock_user, 3)

    cur_user = User.last
    page = 1
    url = "mock_url"
    original_records = User.all.limit(2)
    paginate_users = PaginateUsers.new(original_records, page, url, cur_user)
      
    render_inline(described_class.new(paginate_users: User.all.limit(1)))

    expect_snapshot_match  
    expect(rendered_content).to match "Shared::InfiniteScroll::Component"
    expect(rendered_content).to match "Shared::ListUsers::Component"
  end
end
