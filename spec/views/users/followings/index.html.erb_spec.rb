require 'rails_helper'

RSpec.describe "users/followings/index", type: :view do
  
  describe "renders the index view of User::FollowingsController" do
    def create_users_and_relations
      FactoryBot.reload
      @user1 = FactoryBot.create(:mock_user)
      @user2 = FactoryBot.create(:mock_user)
      @user3 = FactoryBot.create(:mock_user)
      @user4 = FactoryBot.create(:mock_user)
      FactoryBot.create_pair(:mock_relation)
    end

    def update_for_user(user)
      user.reload
      assign(:user, user)

      followings = user.followings
      assign(:followings, followings)
      
      followers = user.followers.with_attached_profile_picture
      assign(:followers, followers)
      
      whiistles = user.whiistles
      assign(:whiistles, whiistles)

      cur_user = @user3
      sign_in cur_user

      relation = cur_user.following_relations.find_by(followed_id: user.id)
      assign(:relation, relation)
    end
    
    it "renders for the first user" do
      create_users_and_relations
      update_for_user(@user1)

      render

      expect(rendered).to match "mock_fullname_2"
      expect(rendered).to match_snapshot('index/first_user')  
    end

    it "renders for the second user" do
      create_users_and_relations
      update_for_user(@user2)

      render

      expect(rendered).to match "mock_fullname_3"
      expect(rendered).to match_snapshot('index/second_user')  
    end

    it "renders for the third user" do
      create_users_and_relations
      update_for_user(@user3)

      render
      
      expect(rendered).to match_snapshot('index/third_user')  
    end

    it "renders for the forth user" do
      create_users_and_relations
      update_for_user(@user4)

      render

      expect(rendered).to match_snapshot('index/forth_user')  
    end
    
  end

end
