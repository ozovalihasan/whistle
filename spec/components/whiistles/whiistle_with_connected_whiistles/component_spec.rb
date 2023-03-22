# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::WhiistleWithConnectedWhiistles::Component, type: :component do
  context "if whiistle is a 'Whiistle' and doesn't have a flood" do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match
      expect(rendered_content).to include 'Whiistles::MainWhiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context "if whiistle is a 'Reply'" do
    it 'renders correctly' do
      reply = create(:mock_reply, whiistle:)

      render_inline(described_class.new(whiistle: reply, current_user_presenter:))

      expect_snapshot_match('as_reply')
      expect(rendered_content).to include 'Whiistles::AllParentsUntilRoot::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context "if whiistle is a 'Flood'" do
    it 'renders correctly' do
      flood = create(:mock_flood, whiistle:)

      render_inline(described_class.new(whiistle: flood, current_user_presenter:))

      expect_snapshot_match('as_flood')
      expect(rendered_content).to include 'Whiistles::AllParentsUntilRoot::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context "if whiistle is a 'Whiistle' with a flood" do
    it 'renders correctly' do
      create(:mock_flood, whiistle:)

      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('with_flood')
      expect(rendered_content).to include 'Whiistles::AllChildrenFloods::Component(flood: Flood, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context "if whiistle is a 'Flood' with a flood" do
    it 'renders correctly' do
      flood = create(:mock_flood, whiistle:)
      create(:mock_flood, whiistle: flood, user: whiistle.user)

      render_inline(described_class.new(whiistle: flood, current_user_presenter:))

      expect_snapshot_match('as_flood_with flood')
      expect(rendered_content).to include 'Whiistles::AllChildrenFloods::Component(flood: Flood, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(4).times
    end
  end
end
