# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::SidebarRight::Component, type: :component do
  it "renders correctly" do

    user = FactoryBot.create(:mock_user)
    user2 = FactoryBot.create(:mock_user)
    user3 = FactoryBot.create(:mock_user)
    user4 = FactoryBot.create(:mock_user)
    FactoryBot.create_list(:mock_relation, 2, following: user4)
    
    sidebar_right_presenter = SidebarRightPresenter.new(user4, user)
    
    render_inline(described_class.new(sidebar_right_presenter: sidebar_right_presenter))

    expect_snapshot_match
    expect(rendered_content).to include "Users::AddDeleteFollowing::Component(user: User, relation: NilClass, cur_user: User)"
    expect(rendered_content).to include "Users::ProfileImage::Component(user: User, shape: Symbol)"
    expect(rendered_content).to match("mock_fullname_4")
    expect(rendered_content).to match("@mock_username_4")
    expect(rendered_content).to include "Users::User::Component(Array, cur_user: User)"
    expect(rendered_content).to include("::Component").exactly(3).times
  end
end
