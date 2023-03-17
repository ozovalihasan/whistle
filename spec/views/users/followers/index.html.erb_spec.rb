require 'rails_helper'

RSpec.describe "users/followers/index", type: :view do
  
  describe "renders the index view of Users::FollowersController" do
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

      expect_snapshot_match('first_user')  
    end

    it "renders for the second user" do
      create_users_and_relations
      update_for_user(@user2)

      render

      expect_snapshot_match('second_user')  
    end

    it "renders for the third user" do
      create_users_and_relations
      update_for_user(@user3)

      render

      expect_snapshot_match('third_user')  
    end

    it "renders for the forth user" do
      create_users_and_relations
      update_for_user(@user4)

      render

      expect_snapshot_match('forth_user')  
    end
    
  end

end
