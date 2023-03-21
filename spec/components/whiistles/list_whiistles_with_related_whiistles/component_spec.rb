# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ListWhiistlesWithRelatedWhiistles::Component, type: :component do
  context "if the whiistle has a label 'shared_whiistle' " do
    it 'renders correctly' do
      whiistle

      whiistles = BaseWhiistle.select(" *, 'shared_whiistle' AS label ")

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_shared_whiistle')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter, show_flood_info: TrueClass)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context "if the whiistle is a Whiistle and has a label 'primary_whiistle' " do
    it 'renders correctly' do
      whiistle

      whiistles = Whiistle.select(" *, 'primary_whiistle' AS label ")

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_primary_whiistle_and_is_a_whiistle')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context "if the whiistle is a Whiistle and has a label 'primary_whiistle' and a flood" do
    it 'renders correctly' do
      whiistle
      FactoryBot.create(:mock_flood, user:)

      whiistles = Whiistle.select(" *, 'primary_whiistle' AS label ")

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_primary_whiistle_and_flood_and_is_a_whiistle')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include 'Whiistles::MinifiedFloods::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context "if the whiistle is a Reply and has a label 'primary_whiistle' and its path is 2 or more" do
    it 'renders correctly' do
      whiistle
      reply = FactoryBot.create(:mock_reply, user:)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ").where(id: reply.id)

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_primary_whiistle_and_2_or_more_and_is_a_reply')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)').exactly(1).times
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context "if the whiistle is a Reply and has a label 'primary_whiistle' and its path is 3 or more" do
    it 'renders correctly' do
      whiistle
      FactoryBot.create(:mock_reply, user:)
      reply = FactoryBot.create(:mock_reply, user:)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ").where(id: reply.id)

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_primary_whiistle_and_3_or_more_and_is_a_reply')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)').exactly(2).times
      expect(rendered_content).to include('::Component').exactly(4).times
    end
  end

  context "if the whiistle is a Reply and has a label 'primary_whiistle' and its path is 4 or more" do
    it 'renders correctly' do
      whiistle
      FactoryBot.create(:mock_reply, user:)
      FactoryBot.create(:mock_reply, user:)
      reply = FactoryBot.create(:mock_reply, user:)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ").where(id: reply.id)

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_primary_whiistle_and_4_or_more_and_is_a_reply')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)').exactly(2).times
      expect(rendered_content).to include('Show more replies')
      expect(rendered_content).to match(%r{/whiistles/#{Whiistle.first.id}})
      expect(rendered_content).to include('::Component').exactly(4).times
    end
  end
end
