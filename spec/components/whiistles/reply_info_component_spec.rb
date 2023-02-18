# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ReplyInfoComponent, type: :component do
  before(:each) do 
    FactoryBot.reload
  end
  
  context "if whiistle is a reply" do
    it "renders correctly" do

      FactoryBot.create(:mock_user)
      FactoryBot.create(:mock_whiistle)
      reply = FactoryBot.create(:mock_reply)
      
      render_inline(described_class.new(whiistle: reply))

      expect(rendered_content).to match_snapshot('ReplyInfoComponent')  
      expect(rendered_content).to match "Replying to"
      expect(rendered_content).to match "@mock_username_1"
    end
    
  end

  context "if whiistle is not a reply" do
    it "doesn't render" do

      FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      
      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to be_empty
    end
    
  end
end
