# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::InfiniteScrollComponent, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    paginated_records = PaginateRecords.new(User.all, nil, "mock_url")
    
    render_inline( described_class.new(paginated_records: paginated_records) ) { "mock_body" }

    expect(rendered_content).to match_snapshot('InfiniteScrollComponent')  
    expect(rendered_content).to match(/mock_body/)
    expect(rendered_content).to match(/mock_url/)
  end
end
