# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::ProfileImage::Component, type: :component do
  describe 'renders with different shapes' do
    it 'renders correctly if its shape is empty' do
      render_inline(described_class.new(user:))

      expect_snapshot_match('without_shape')
      expect(rendered_content).to include('class="h-[50px] w-[50px] "')
    end

    it 'renders correctly if its shape is default' do
      render_inline(described_class.new(user:, shape: :default))

      expect_snapshot_match('default_shape')
      expect(rendered_content).to include('class="h-[50px] w-[50px] "')
    end

    it 'renders correctly if its shape is rounded' do
      render_inline(described_class.new(user:, shape: :rounded))

      expect_snapshot_match('rounded_shape')
      expect(rendered_content).to match(/rounded-full/)
    end
  end

  describe 'renders with different sizes' do
    it 'renders correctly if its size is empty' do
      render_inline(described_class.new(user:))

      expect_snapshot_match('without_size')
      expect(rendered_content).to include('h-[50px] w-[50px]')
    end

    it 'renders correctly if its size is default' do
      render_inline(described_class.new(user:, size: :default))

      expect_snapshot_match('default_size')
      expect(rendered_content).to include('h-[50px] w-[50px]')
    end

    it 'renders correctly if its size is rounded' do
      render_inline(described_class.new(user:, size: :small))

      expect_snapshot_match('small_size')
      expect(rendered_content).to include('h-[25px] w-[25px]')
    end
  end
end
