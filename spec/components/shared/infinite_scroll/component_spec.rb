# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::InfiniteScroll::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    paginate_records = PaginateRecords.new(User.all, nil, "mock_url")
    
    render_inline( described_class.new(paginate_records: paginate_records) ) { "mock_body" }

    expect_snapshot_match  
    expect(rendered_content).to match(/mock_body/)
    expect(rendered_content).to match(/mock_url/)
  end
end
