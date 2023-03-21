# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::BodyAndPictures::Component, type: :component do
  before { FactoryBot.reload }

  context 'if any optional argument is not provided and the whiistle is quoting another whiistle' do
    it 'renders correctly' do
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      quoting_whiistle = FactoryBot.create(:mock_whiistle, quoted_whiistle: whiistle, user:)

      render_inline(described_class.new(whiistle: quoting_whiistle))

      expect_snapshot_match('with_default_arguments')
      expect(rendered_content).to include 'mock_body_whiistle'
      expect(rendered_content).to include 'Whiistles::Pictures::Component(whiistle: Whiistle)'
      expect(rendered_content).to include 'Whiistles::QuotedWhiistle::Component(whiistle: Whiistle)'
      expect(rendered_content).to include('::Component').exactly(2).times
    end
  end

  context "if the argument 'show_quoted_whiistle' is false or the whiistle is not quoting another whiistle" do
    it 'renders correctly' do
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      quoting_whiistle = FactoryBot.create(:mock_whiistle, quoted_whiistle: whiistle, user:)

      render_inline(described_class.new(whiistle: quoting_whiistle, show_quoted_whiistle: false))

      expect_snapshot_match('with_show_quoted_whiistle-false')
      expect(rendered_content).not_to include 'Whiistles::QuotedWhiistle::Component'
      expect(rendered_content).to include('::Component').exactly(1).times
    end

    it 'renders correctly' do
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)

      render_inline(described_class.new(whiistle:))

      expect_snapshot_match('without_quoting_any_whiistle')
      expect(rendered_content).not_to include 'Whiistles::QuotedWhiistle::Component'
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end

  context "if the argument 'show_quoted_whiistle' is false" do
    it 'renders correctly' do
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)

      render_inline(described_class.new(whiistle:, show_pictures: false))

      expect_snapshot_match('show_pictures-false')
      expect(rendered_content).not_to include 'Whiistles::Pictures::Component'
      expect(rendered_content).to include('::Component').exactly(0).times
    end
  end
end
