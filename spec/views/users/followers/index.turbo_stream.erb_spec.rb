require 'rails_helper'

RSpec.describe "users/followers/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::FollowersController" do
    it "renders correctly" do
      FactoryBot.reload
      user = FactoryBot.create(:mock_user)
      user2 = FactoryBot.create(:mock_user)
      user3 = FactoryBot.create(:mock_user)
      create_list(:mock_relation, 2, followed: user3)
      
      followers = user3.followers
      paginate_users = PaginateUsers.new(followers, 1, user_followers_url(user3), user)
      assign(:paginate_users, paginate_users)

      sign_in user      

      render

      expect(rendered).to match_snapshot('index_turbo_stream')
      expect(rendered).to include('mock_fullname_1').exactly(1).times
      expect(rendered).to include('mock_fullname_2').exactly(1).times

    end
  end

end
