# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::BodyAndPicturesComponent, type: :component do
  before(:each) { FactoryBot.reload }
  
  context "if any optional argument is not provided and the whiistle is quoting another whiistle" do
    
    it "renders correctly" do

      mock_components([
        Whiistles::PicturesComponent, 
        Whiistles::QuotedWhiistleComponent
      ])
      
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      quoting_whiistle = FactoryBot.create(:mock_whiistle, quoted_whiistle: whiistle, user: user)

      render_inline(described_class.new(whiistle: quoting_whiistle))

      expect(rendered_content).to match_snapshot('BodyAndPicturesComponent_with_default_arguments')  
      expect(rendered_content).to include "mock_body_whiistle"
      expect(rendered_content).to include "Whiistles::PicturesComponent"
      expect(rendered_content).to include "Whiistles::QuotedWhiistleComponent"
    end
  end

  context "if the argument 'show_quoted_whiistle' is false or the whiistle is not quoting another whiistle" do
    
    it "renders correctly" do

      mock_components([
        Whiistles::PicturesComponent
      ])
      
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      quoting_whiistle = FactoryBot.create(:mock_whiistle, quoted_whiistle: whiistle, user: user)

      render_inline(described_class.new(whiistle: quoting_whiistle, show_quoted_whiistle: false))

      expect(rendered_content).to match_snapshot('BodyAndPicturesComponent_with_show_quoted_whiistle-false')  
      expect(rendered_content).not_to include "Whiistles::QuotedWhiistleComponent"
    end
    
    it "renders correctly" do

      mock_components([
        Whiistles::PicturesComponent
      ])
      
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      
      render_inline(described_class.new(whiistle: whiistle))

      expect(rendered_content).to match_snapshot('BodyAndPicturesComponent_without_quoting_any_whiistle')  
      expect(rendered_content).not_to include "Whiistles::QuotedWhiistleComponent"
    end
  end
  
  context "if the argument 'show_quoted_whiistle' is false" do
    
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      
      render_inline(described_class.new(whiistle: whiistle, show_pictures: false))

      expect(rendered_content).to match_snapshot('BodyAndPicturesComponent_show_pictures-false')  
      expect(rendered_content).not_to include "Whiistles::PicturesComponent"
    end
  end

end
