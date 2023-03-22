# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SidebarRight::Component, type: :component do
  it 'renders correctly' do
    create_pair(:mock_user)
    create(:mock_relation)

    sidebar_right_presenter = SidebarRightPresenter.new(User.last, cur_user)

    render_inline(described_class.new(sidebar_right_presenter:))

    expect_snapshot_match
    expect(rendered_content).to include 'Users::AddDeleteFollowing::Component(user: User, relation: NilClass, cur_user: User)'
    expect(rendered_content).to include 'Users::ProfileImage::Component(user: User, shape: Symbol)'
    expect(rendered_content).to match('mock_fullname_2')
    expect(rendered_content).to match('@mock_username_2')
    expect(rendered_content).to include 'Users::User::Component(Array, cur_user: User)'
    expect(rendered_content).to include('::Component').exactly(3).times
  end
end
