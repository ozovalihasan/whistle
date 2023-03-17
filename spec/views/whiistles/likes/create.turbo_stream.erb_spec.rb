require 'rails_helper'

RSpec.describe "whiistles/likes/create.turbo_stream", type: :view do
  
  before(:each) do
    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
  end
  
  describe "renders the create turbo stream view of Whiistles::LikesController" do
    it "renders turbo_streams correctly if the like is saved" do
      like = FactoryBot.build(:mock_like)
      flash[:notice] = "The like is saved" if like.save
      assign(:like, like)

      render 

      expect_snapshot_match('successful')  
    end

    it "renders turbo_streams correctly if the like is not saved" do
      like = FactoryBot.build(:mock_like, whiistle_id: Whiistle.first.id + 1)
      flash[:alert] = "The like is not saved" unless like.save
      assign(:like, like)

      render 
      
      expect_snapshot_match('fail')  
    end
  end

end
