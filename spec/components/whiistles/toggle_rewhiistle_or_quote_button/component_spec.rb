# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ToggleRewhiistleOrQuoteButton::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(whiistle:, current_user_presenter:))

    expect_snapshot_match
    expect(rendered_content).to include 'Whiistles::ToggleRewhiistleButton::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include 'Whiistles::QuotedWhiistleButton::Component(whiistle: Whiistle)'
    expect(rendered_content).to include('click->dropdown#toggle').exactly(2).times
    expect(rendered_content).to include 'click@window->dropdown#hide'
    expect(rendered_content).to match(/rewhiistle_or_quote_button_whiistle_\d+/)
    expect(rendered_content).to include 'Whiistles::ButtonContainer::Component()'
    expect(rendered_content).to include('::Component').exactly(4).times
  end

  context 'if the whiistle is rewhiistled by the current user' do
    it 'renders correctly' do
      create(:mock_rewhiistle, whiistle:, user: cur_user)

      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('rewhiistled')
      expect(rendered_content).to include 'Whiistles::DestroyRewhiistleOrQuoteButton::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(4).times
    end
  end

  context 'if the whiistle is not rewhiistled by the current user' do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('not_rewhiistled')
      expect(rendered_content).to include 'Whiistles::CreateRewhiistleOrQuoteButton::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(4).times
    end
  end
end
