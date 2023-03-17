require 'rails_helper'

RSpec.describe "whiistles/likes/destroy.turbo_stream", type: :view do
  
  describe "renders the destroy(turbo_stream) view of Users::FollowingsController" do
    it "renders turbo_streams correctly if the like is saved" do
      FactoryBot.create(:mock_user)
      FactoryBot.create(:mock_whiistle)
      like = FactoryBot.build(:mock_like)
      like.destroy
      flash[:notice] = "mock notice"
      assign(:like, like)

      render 

      expect_snapshot_match
      expect(rendered).to include("StreamAnimations::UpdateAll::Component(targets: String)")
      expect(rendered).to include("Whiistles::CreateLikeButton::Component(whiistle: Whiistle)")
      expect(rendered).to include("Streams::UpdateFlashes::Component(notice: String, alert: NilClass)")
      expect(rendered).to include("::Component").exactly(3).times
    end
  end
  

end
