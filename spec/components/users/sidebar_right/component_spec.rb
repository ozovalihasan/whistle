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

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Users::User::Component(Array, cur_user: User)"
    expect(rendered_content).to match("mock_fullname_4")
    expect(rendered_content).to match("@mock_username_4")
  end
end
