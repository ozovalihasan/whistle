# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'relations/destroy.turbo_stream', type: :view do
  before do
    FactoryBot.create_pair(:mock_user)
    FactoryBot.create(:mock_relation)
  end

  describe 'renders the destroy turbo stream view of RelationsController' do
    it 'renders turbo_streams correctly if the relation is destroyed' do
      relation = Relation.first
      relation.destroy
      flash[:notice] = 'mock_notice_message'
      assign(:relation, relation)

      render

      expect_snapshot_match
      expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
      expect(rendered).to match(/action="update" target="left_side_followings_count_user_\d+"/)
      expect(rendered).to match(/action="update" target="followers_count_user_\d+"/)
      expect(rendered).to match(/action="update" target="create_delete_relation_user_\d+"/)
      expect(rendered).to include('::Component').exactly(2).times
    end
  end
end
