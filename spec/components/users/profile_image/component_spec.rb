# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileImage::Component, type: :component do
  describe "renders with different shapes" do
  
    it "renders correctly if its shape is empty" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user))

      expect(rendered_content).to match_custom_snapshot('without_shape')  
      expect(rendered_content).to include('class="h-[50px] w-[50px] "')
    end

    it "renders correctly if its shape is default" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user, shape: :default))

      expect(rendered_content).to match_custom_snapshot('default_shape')  
      expect(rendered_content).to match(//)
      expect(rendered_content).to include('class="h-[50px] w-[50px] "')
    end

    it "renders correctly if its shape is rounded" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user, shape: :rounded))

      expect(rendered_content).to match_custom_snapshot('rounded_shape')  
      expect(rendered_content).to match(/rounded-full/)
    end
  end

  describe "renders with different sizes" do
  
    it "renders correctly if its size is empty" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user))

      expect(rendered_content).to match_custom_snapshot('without_size')  
      expect(rendered_content).to include("h-[50px] w-[50px]")
    end

    it "renders correctly if its size is default" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user, size: :default))

      expect(rendered_content).to match_custom_snapshot('default_size')  
      expect(rendered_content).to include("h-[50px] w-[50px]")
    end

    it "renders correctly if its size is rounded" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user, size: :small))

      expect(rendered_content).to match_custom_snapshot('small_size')  
      expect(rendered_content).to include("h-[25px] w-[25px]")
    end
  end
end
