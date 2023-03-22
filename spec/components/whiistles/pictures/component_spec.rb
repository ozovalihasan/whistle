# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::Pictures::Component, type: :component do
  context "if the whiistle doesn't have any picture" do
    it "doesn't render anything" do
      render_inline(described_class.new(whiistle:))

      expect(rendered_content).to be_empty
    end
  end

  context 'if the whiistle has pictures' do
    it 'renders correctly' do
      whiistle
      whiistle.pictures.attach(
        [
          io: Rails.root.join('app', 'assets', 'images', 'mock-1.jpg').open,
          filename: 'mock-1.jpg',
          content_type: 'image/jpeg'
        ]
      )

      render_inline(described_class.new(whiistle:))

      expect_snapshot_match
      expect(rendered_content).to include 'modal#openAndVisit'
      expect(rendered_content).to match(/img.*src.*jpg/)
    end
  end
end
