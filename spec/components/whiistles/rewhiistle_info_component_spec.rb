# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::RewhiistleInfoComponent, type: :component do
  
  before(:each) do
    FactoryBot.reload
  end
  
  context "if a whiistle has the label 'shared_whiistle'" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      FactoryBot.create(:mock_whiistle)
      FactoryBot.create(:mock_rewhiistle)
      
      whiistle = BaseWhiistle.joins(rewhiistles: :user)
                            .select("'shared_whiistle' AS label, users.fullname AS parent_user")
                            .first
      
      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to match_custom_snapshot("with_the_correct_label")  
      expect(rendered_content).to match "mock_fullname_1"
    end
  end

  context "if a whiistle doesn't have the label 'shared_whiistle'" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)

      FactoryBot.create(:mock_whiistle)
      FactoryBot.create(:mock_rewhiistle)
      
      whiistle = BaseWhiistle.joins(:user)
                            .select("users.fullname AS parent_user")
                            .first
      
      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to match_custom_snapshot("without_the_correct_label")  
      expect(rendered_content).not_to match "mock_fullname_1"
    end
  end
end
