require 'rails_helper'

RSpec.describe "whiistles/rewhiistles/destroy.turbo_stream", type: :view do
  
  describe "renders the destroy turbo stream view of Whiistles::RewhiistlesController" do
    it "renders correctly" do
      FactoryBot.reload
      user = FactoryBot.create(:mock_user)
      FactoryBot.create(:mock_user)

      main_whiistle = FactoryBot.create(:mock_whiistle, user: user)
      rewhiistle = FactoryBot.create(:mock_rewhiistle)
      assign(:rewhiistle, rewhiistle)

      rewhiistle.destroy!

      flash[:notice] = "The rewhiistle is destroyed"
      
      subcomponents = [ Whiistles::CreateRewhiistleOrQuoteButton::Component ]
      mock_components(subcomponents)
      
      render

      expect_snapshot_match
      expect(rendered).to include("The rewhiistle is destroyed").exactly(1).times
      expect(rendered).to include("Whiistles::CreateRewhiistleOrQuoteButton::Component(whiistle: Whiistle)")
      expect(rendered).to match(/button(.|\n)*Rewhiistle(.|\n)*button/)

    end
  end

end
