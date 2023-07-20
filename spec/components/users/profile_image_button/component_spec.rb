# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::ProfileImageButton::Component, type: :component do
  context 'if a size is defined' do
    it 'renders correctly' do
      render_inline(described_class.new(user:, size: :mock_size))

      expect_snapshot_match('with_size')
      expect(rendered_content).to include('Users::ProfileImage::Component(user: User, size: Symbol)')
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end

  context 'if a size is not defined' do
    it 'renders correctly' do
      render_inline(described_class.new(user:))

      expect_snapshot_match('without_size')
      expect(rendered_content).to include('Users::ProfileImage::Component(user: User, size: NilClass)')
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end
end
