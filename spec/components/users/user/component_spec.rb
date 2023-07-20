# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::User::Component, type: :component do
  context "if the user responds to the method 'is_followed_by_cur_user' as true" do
    it 'renders correctly' do
      user
      user_selected = User.all.select('*, true AS is_followed_by_cur_user').take

      render_inline(described_class.new(user: user_selected))

      expect_snapshot_match('followed')
      expect(rendered_content).to include 'Users::ProfileImage::Component(user: User)'
      expect(rendered_content).to include('::Component').exactly(1).times
      expect(rendered_content).to match('mock_fullname_1')
      expect(rendered_content).to match('mock_username_1')
    end
  end

  context "if the user responds to the method 'is_followed_by_cur_user' as false" do
    it 'renders correctly' do
      user
      user_selected = User.all.select('*, false AS is_followed_by_cur_user').take

      render_inline(described_class.new(user: user_selected))

      expect_snapshot_match('not_followed')
      expect(rendered_content).to include 'Users::ProfileImage::Component(user: User)'
      expect(rendered_content).to include 'Users::FollowButton::Component(user: User)'
      expect(rendered_content).to include('::Component').exactly(2).times
      expect(rendered_content).to match('mock_fullname_1')
      expect(rendered_content).to match('mock_username_1')
    end
  end
end
