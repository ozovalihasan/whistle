# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::AllParentsUntilRoot::Component, type: :component do
  context "if the whiistle's parent is a flood" do
    it 'renders correctly' do
      whiistle
      create_list(:mock_flood, 2, user:)
      flood = Flood.last

      render_inline(described_class.new(whiistle: flood.whiistle, current_user_presenter:))

      expect_snapshot_match('with_flood')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context "if the whiistle's parent is a reply" do
    it 'renders correctly' do
      whiistle
      create_list(:mock_reply, 2, user:)
      reply = Reply.last

      render_inline(described_class.new(whiistle: reply.whiistle, current_user_presenter:))

      expect_snapshot_match('with_reply')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context "if the whiistle's parent is a reply and its grandparent is a flood" do
    it 'renders correctly' do
      whiistle
      grandparent = create(:mock_flood, user:)
      parent_reply = create(:mock_reply, whiistle: grandparent, user:)
      create(:mock_reply, whiistle: parent_reply, user:)
      reply = Reply.last

      render_inline(described_class.new(whiistle: reply.whiistle, current_user_presenter:))

      expect_snapshot_match('with_flood_and_reply')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end
end
