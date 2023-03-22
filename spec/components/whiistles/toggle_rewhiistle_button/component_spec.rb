# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ToggleRewhiistleButton::Component, type: :component do
  context 'if the whiistle is rewhiistled' do
    it 'renders correctly' do
      create(:mock_rewhiistle, whiistle:)

      current_user_presenter = CurrentUserPresenter.new(user)

      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('rewhiistled')
      expect(rendered_content).to match 'Whiistles::DestroyRewhiistleButton::Component'
    end
  end

  context 'if the whiistle is not rewhiistled' do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('not_rewhiistled')
      expect(rendered_content).to match 'Whiistles::CreateRewhiistleButton::Component'
    end
  end
end
