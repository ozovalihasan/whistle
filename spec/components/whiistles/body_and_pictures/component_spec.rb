# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::BodyAndPictures::Component, type: :component do
  before(:each) { FactoryBot.reload }
  
  context "if any optional argument is not provided and the whiistle is quoting another whiistle" do
    
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      quoting_whiistle = FactoryBot.create(:mock_whiistle, quoted_whiistle: whiistle, user: user)

      render_inline(described_class.new(whiistle: quoting_whiistle))

      expect(rendered_content).to match_custom_snapshot('with_default_arguments')  
      expect(rendered_content).to include "mock_body_whiistle"
      expect(rendered_content).to include "Whiistles::Pictures::Component(whiistle: Whiistle)"
      expect(rendered_content).to include "Whiistles::QuotedWhiistle::Component(whiistle: Whiistle)"
    end
  end

  context "if the argument 'show_quoted_whiistle' is false or the whiistle is not quoting another whiistle" do
    
    it "renders correctly" do
      
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      quoting_whiistle = FactoryBot.create(:mock_whiistle, quoted_whiistle: whiistle, user: user)

      render_inline(described_class.new(whiistle: quoting_whiistle, show_quoted_whiistle: false))

      expect(rendered_content).to match_custom_snapshot('with_show_quoted_whiistle-false')  
      expect(rendered_content).not_to include "Whiistles::QuotedWhiistle::Component"
    end
    
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      
      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to match_custom_snapshot('without_quoting_any_whiistle')  
      expect(rendered_content).not_to include "Whiistles::QuotedWhiistle::Component"
    end
  end
  
  context "if the argument 'show_quoted_whiistle' is false" do
    
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      
      render_inline(described_class.new(whiistle: whiistle, show_pictures: false))

      expect(rendered_content).to match_custom_snapshot('show_pictures-false')  
      expect(rendered_content).not_to include "Whiistles::Pictures::Component"
    end
  end

end
