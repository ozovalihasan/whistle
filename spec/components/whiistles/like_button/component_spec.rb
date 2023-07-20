# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::LikeButton::Component, type: :component do
  context 'if the current user likes the whiistle' do
    it 'renders correctly' do
      whiistle
      create(:mock_like, user: cur_user)

      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('user_likes_whiistle')
      expect(rendered_content).to include 'Whiistles::DestroyLikeButton::Component(like: Like)'
      expect(rendered_content).to match(/like_button_whiistle_\d+/)
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end

  context "if the current user doesn't like the whiistle" do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('user_not like_whiistle')
      expect(rendered_content).to include 'Whiistles::CreateLikeButton::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end
end
