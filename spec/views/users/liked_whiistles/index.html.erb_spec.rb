require 'rails_helper'

RSpec.describe "users/liked_whiistles/index", type: :view do
  
  describe "renders the index(html) view of User::LikedWhiistlesController" do

    it "renders correctly" do
      FactoryBot.reload
      FactoryBot.create_pair(:mock_user)

      user = User.first

      FactoryBot.create(:mock_relation)
      FactoryBot.create_list(:mock_whiistle, 3, user: user)
      FactoryBot.create_list(:mock_like, 2, user: user)

      assign(:user, user)

      followings = user.followings
      assign(:followings, followings)
      
      followers = user.followers
      assign(:followers, followers)
      
      whiistles = user.whiistles
      assign(:whiistles, whiistles)

      last_page = 2
      assign(:last_page, last_page)

      page = 1
      assign(:page, page)

      all_whiistles = user.liked_whiistles
      assign(:all_whiistles, all_whiistles)

      paginated_whiistles = all_whiistles.take(1)
      assign(:paginated_whiistles, paginated_whiistles)

      relation = Relation.first
      assign(:relation, relation)

      sign_in User.last      

      render

      expect(rendered).to match_snapshot('index_html')
      expect(rendered).to match('2 Whiistles')
      expect(rendered).to match('mock_body_2')  
      expect(rendered).not_to match('mock_body_1')
      expect(rendered).not_to match('mock_body_3')
    end
  end
end
