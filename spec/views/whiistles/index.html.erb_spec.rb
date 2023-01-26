require 'rails_helper'

RSpec.describe "whiistles/index", type: :view do
  
  describe "renders the index view of WhiistlesController" do

    it "renders correctly" do
      FactoryBot.reload
      user = FactoryBot.create(:mock_user)
      user2 = FactoryBot.create(:mock_user)
      FactoryBot.create_list(:mock_user, 4)
      user.followings << user2

      travel_to(Time.new(2000, 1, 1, 1, 1, 1)) do
        main_whiistle = FactoryBot.create(:mock_whiistle, user: user2)
        FactoryBot.create(:mock_flood, user: user2, whiistle: main_whiistle)

        user3 = User.last
        main_whiistle = FactoryBot.create(:mock_whiistle, user: user3)
        FactoryBot.create(:mock_flood, user: user3, whiistle: main_whiistle)
        
        FactoryBot.create(:mock_reply, user: user2, whiistle: main_whiistle)
        FactoryBot.create(:mock_rewhiistle, user: user2, whiistle: main_whiistle)
        FactoryBot.create(:mock_like, user: user2, whiistle: main_whiistle)
      end

      all_whiistles = user.main_page_whiistles
      paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], whiistles_url)
      paginated_whiistles.set_for_whiistles_index_page
      assign(:paginated_whiistles, paginated_whiistles)

      whiistle = Whiistle.new
      assign(:whiistle, whiistle)

      suggested_users = user.suggested_users
      assign(:suggested_users, suggested_users)

      sign_in user      

      travel_to(Time.new(2001, 1, 1, 1, 1, 1)) do
        render
      end

      expect(rendered).to match_snapshot('index_html')
      expect(rendered).to include('mock_body_whiistle_1').exactly(1).times
      expect(rendered).to include('mock_body_whiistle_2').exactly(3).times
      expect(rendered).to include('Show this thread').exactly(3).times

    end
  end

end
