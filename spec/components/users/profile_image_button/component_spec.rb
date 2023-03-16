# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::ProfileImageButton::Component, type: :component do
  
  context "if a size is defined" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user, size: :mock_size))
  
      expect_snapshot_match("with_size")  
      expect(rendered_content).to include("Users::ProfileImage::Component(user: User, size: Symbol)")
  
    end  
  end

  context "if a size is not defined" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      
      render_inline(described_class.new(user: user))
  
      expect_snapshot_match("without_size")  
      expect(rendered_content).to include("Users::ProfileImage::Component(user: User, size: NilClass)")
  
    end  
  end
end
