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

      flash[:notice] = "mock_notice"
            
      render

      expect_snapshot_match
      expect(rendered).to match(/turbo-stream action="update" targets=".rewhiistle_button_whiistle_\d+"/)
      expect(rendered).to include('Whiistles::CreateRewhiistleButton::Component(whiistle: Whiistle)')
      expect(rendered).to include('StreamAnimations::UpdateAll::Component(targets: String)')
      expect(rendered).to include('Whiistles::CreateRewhiistleOrQuoteButton::Component(whiistle: Whiistle)')
      expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
      expect(rendered).to include("::Component").exactly(4).times
    end
  end

end
