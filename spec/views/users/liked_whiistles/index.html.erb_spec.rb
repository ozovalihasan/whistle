require 'rails_helper'

RSpec.describe "users/liked_whiistles/index", type: :view do
  
  describe "renders the index(html) view of Users::LikedWhiistlesController" do


    it "renders correctly" do
      FactoryBot.reload
      FactoryBot.create_pair(:mock_user)
      user = User.first
      assign(:user, user)
      cur_user = User.last

      travel_to(Time.new(2001, 1, 1, 1, 1, 1)) do
        FactoryBot.create_list(:mock_whiistle, 2, user: user)
        FactoryBot.create_list(:mock_like, 2, user: user)
      end

      all_whiistles = user.liked_whiistles.includes(user:  [{ profile_picture_attachment: :blob }])
      paginate_whiistles = PaginateWhiistles.new(all_whiistles, nil, user_liked_whiistles_url(user), cur_user)
      paginate_whiistles.set_basic
      assign(:paginate_whiistles, paginate_whiistles)

      relation = nil
      assign(:relation, relation)

      sign_in cur_user      

      travel_to(Time.new(2001, 1, 1, 1, 1, 1)) do
        render
      end

      expect(rendered).to match_snapshot('index_html')
      expect(rendered).to match('2 Whiistles')
      expect(rendered).to match('mock_body_whiistle_1')  
      expect(rendered).to match('mock_body_whiistle_2')  
    end
  end
end
