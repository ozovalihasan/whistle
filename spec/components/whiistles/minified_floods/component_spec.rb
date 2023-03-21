# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::MinifiedFloods::Component, type: :component do
  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(cur_user)
  end

  let(:whiistle) do
    FactoryBot.create(:mock_whiistle)
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:initialize_models) do
    user
    whiistle
  end

  let(:render_component) do
    render_inline(described_class.new(whiistle:, current_user_presenter:))
  end

  context 'if the whiistle has three or more floods' do
    it 'renders correctly' do
      initialize_models
      FactoryBot.create_list(:mock_flood, 3, user:)

      render_component

      expect_snapshot_match('three_or_more')
      expect(rendered_content).to include('Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)').exactly(2).times
      expect(rendered_content).to include 'Whiistles::FloodInfo::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(3).times
    end
  end

  context 'if the whiistle has two floods' do
    it 'renders correctly' do
      initialize_models
      FactoryBot.create_list(:mock_flood, 2, user:)

      render_component

      expect_snapshot_match('two')
      expect(rendered_content).to include('Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)').exactly(2).times
      expect(rendered_content).not_to include 'Whiistles::FloodInfo::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context 'if the whiistle has only one flood' do
    it 'renders correctly' do
      initialize_models
      FactoryBot.create(:mock_flood, user:)

      render_component

      expect_snapshot_match('one')
      expect(rendered_content).to include('Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)').exactly(1).times
      expect(rendered_content).not_to include 'Whiistles::FloodInfo::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end
end
