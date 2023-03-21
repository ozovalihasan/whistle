# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::Whiistle::Component, type: :component do
  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(cur_user)
  end

  let(:whiistle) do
    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
  end

  let(:expect_mandatory_components) do
    expect(rendered_content).to include 'Whiistles::RewhiistleInfo::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::LikeInfo::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Users::ProfileImageButton::Component(user: User)'
    expect(rendered_content).to include 'Whiistles::UserNamesWithTimestamp::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::ReplyInfo::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::BodyAndPictures::Component(whiistle: Whiistle)'
    expect(rendered_content).to include 'Whiistles::Buttons::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)'
  end

  context 'if it is not necessary to show the flood info' do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:, current_user_presenter:))

      expect_snapshot_match('without_flood_info')
      expect_mandatory_components
      expect(rendered_content).to include('::Component').exactly(7).times
    end
  end

  context 'if it is necessary to show the flood info' do
    it 'renders correctly' do
      render_inline(described_class.new(whiistle:, current_user_presenter:,
                                        show_flood_info: true))

      expect_snapshot_match('with_flood_info')
      expect_mandatory_components
      expect(rendered_content).to include 'Whiistles::FloodInfo::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(8).times
    end
  end
end
