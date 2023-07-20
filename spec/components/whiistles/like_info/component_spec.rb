# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::LikeInfo::Component, type: :component do
  context "if the whiistle has a label 'liked_whiistle'" do
    it 'renders correctly' do
      create(:mock_like, whiistle:)

      whiistle = BaseWhiistle.joins(likes: :user).select("
                                                    'liked_whiistle' AS label,
                                                    users.fullname AS parent_user
                                                  ").first

      render_inline(described_class.new(whiistle:))

      expect_snapshot_match
      expect(rendered_content).to include 'mock_fullname_1 liked'
    end
  end

  context "if the whiistle doesn't respond to `label` method" do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:))

      expect(rendered_content).to be_empty
    end
  end

  context "if the whiistle doesn't have a label 'liked_whiistle'" do
    it 'renders correctly' do
      whiistle
      whiistle = BaseWhiistle.joins(likes: :user).select("
                                                    'primary_whiistle' AS label,
                                                    '' AS parent_user
                                                  ").first

      render_inline(described_class.new(whiistle:))

      expect(rendered_content).to be_empty
    end
  end
end
