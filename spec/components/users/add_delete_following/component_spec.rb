# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::AddDeleteFollowing::Component, type: :component do
  context "if the current user doesn't follow another user" do
    it 'renders correctly' do
      render_inline(described_class.new(user:, cur_user:, relation: nil))

      expect_snapshot_match('without_relation')
      expect(rendered_content).to include 'Users::AddFollowing::Component(user_id: Integer)'
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end

  context 'if the current user follows another user' do
    it 'renders correctly' do
      relation = create(:mock_relation, following: cur_user, followed: user)

      render_inline(described_class.new(user:, cur_user:, relation:))

      expect_snapshot_match('with_relation')
      expect(rendered_content).to include 'Users::DeleteFollowing::Component(relation: Relation)'
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end

  context 'if another user is the current user' do
    it 'renders correctly' do
      cur_user = user

      render_inline(described_class.new(user:, cur_user:, relation: nil))

      expect_snapshot_match('self')
      expect(rendered_content).to be_empty
    end
  end
end
