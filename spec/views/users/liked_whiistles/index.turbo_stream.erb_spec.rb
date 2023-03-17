require 'rails_helper'

RSpec.describe "users/liked_whiistles/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::LikedWhiistlesController" do

    it "renders correctly" do
      FactoryBot.reload
      FactoryBot.create(:mock_user)
      user = User.first
      assign(:user, user)
      user2 = User.last

      travel_to(Time.new(2000, 1, 1, 1, 1, 1)) do
        FactoryBot.create_list(:mock_whiistle, 2, user: user)
        FactoryBot.create_list(:mock_like, 2, user: user)
      end

      all_whiistles = BaseWhiistle.all
      paginate_whiistles = PaginateWhiistles.new(all_whiistles, 1, user_liked_whiistles_url(user))
      paginate_whiistles.set_basic
      assign(:paginate_whiistles, paginate_whiistles)

      relation = nil
      assign(:relation, relation)

      sign_in user2      
      
      travel_to(Time.new(2001, 1, 1, 1, 1, 1)) do
        render
      end

      expect_snapshot_match
      expect(rendered).to match('mock_body_whiistle_1')  
      expect(rendered).to match('mock_body_whiistle_2') 
    end
  end
end
