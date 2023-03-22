# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ListWhiistlesForWhiistlesIndexPage::Component, type: :component do
  context "if the whiistle is a reply and has a label 'primary_whiistle'" do
    it 'renders correctly' do
      whiistle
      create(:mock_reply)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ")
      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('with_reply')
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include 'Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to match(/mock_fullname_\d+ replied/)
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context "if the whiistle is not a reply or doesn't have a label 'primary_whiistle'" do
    it 'renders correctly' do
      whiistle
      whiistles = Whiistle.select(" *, 'primary_whiistle' AS label ")

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('without_reply')
      expect(rendered_content).to include 'Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end
  
  context "if the whiistle doesn't have a label 'primary_whiistle'" do
    it 'renders correctly' do
      whiistle
      create(:mock_reply)
      whiistles = Whiistle.select(" *, 'not_primary_whiistle' AS label ")

      render_inline(described_class.new(whiistles:, current_user_presenter:))

      expect_snapshot_match('without_primary_whiistle_label')
      expect(rendered_content).to include 'Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end
end
