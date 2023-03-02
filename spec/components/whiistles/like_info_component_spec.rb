# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::LikeInfoComponent, type: :component do
  before(:each) do
    FactoryBot.reload
  end
  
  context "if the whiistle has a label 'liked_whiistle'" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      FactoryBot.create(:mock_like)

      whiistle = BaseWhiistle.joins(likes: :user).select(" 
                                                    'liked_whiistle' AS label,
                                                    users.fullname AS parent_user 
                                                  ").first
      
      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to match_custom_snapshot  
      expect(rendered_content).to include "mock_fullname_1 liked"
    end
  end

  context "if the whiistle doesn't have a label 'liked_whiistle' or respond to `label` method" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)

      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to be_empty
    end

    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = BaseWhiistle.joins(likes: :user).select(" 
                                                    'primary_whiistle' AS label,
                                                    '' AS parent_user 
                                                  ").first

      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to be_empty
    end
  end
end
