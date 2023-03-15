# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::ListUsers::Component, type: :component do
  it "renders paginated users correctly" do
    user = FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_user)
    
    paginate_users = PaginateUsers.new(User.all, nil, nil, user)
    
    render_inline( described_class.new(paginate_users: paginate_users) )

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include "Users::User::Component(ActiveRecord::Relation, cur_user: User)"
  end
end

