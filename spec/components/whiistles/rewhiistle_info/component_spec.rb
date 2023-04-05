# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::RewhiistleInfo::Component, type: :component do
  context "if a whiistle has the label 'shared_whiistle'" do
    it 'renders correctly' do
      create(:mock_rewhiistle, whiistle:)

      whiistle = BaseWhiistle.joins(rewhiistles: :user)
                             .select("'shared_whiistle' AS label, users.fullname AS parent_user")
                             .first

      render_inline(described_class.new(whiistle:))

      expect_snapshot_match('with_the_correct_label')
      expect(rendered_content).to match 'mock_fullname_1'
    end
  end

  context "if a whiistle doesn't have the label 'shared_whiistle'" do
    it 'renders correctly' do
      create(:mock_rewhiistle, whiistle:)

      whiistle = BaseWhiistle.joins(:user)
                             .select('users.fullname AS parent_user')
                             .first

      render_inline(described_class.new(whiistle:))

      expect_snapshot_match('without_the_correct_label')
      expect(rendered_content).not_to match 'mock_fullname_1'
    end
  end
end
