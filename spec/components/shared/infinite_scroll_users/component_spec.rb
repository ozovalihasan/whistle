# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::InfiniteScrollUsers::Component, type: :component do
  it "renders paginated users correctly" do
    user = FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_user)
    
    paginated_users = PaginateUsers.new(User.all, nil, nil, user)
    
    render_inline( described_class.new(paginated_users: paginated_users) )

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match(/mock_fullname_1/)
    expect(rendered_content).to match(/mock_fullname_2/)
  end
end

