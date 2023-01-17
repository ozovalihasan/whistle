require 'rails_helper'

RSpec.describe "whiistles/likes/create", type: :view do
  
  before(:each) do
    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
    sign_in User.first
  end
  
  describe "renders the create turbo stream view of Whiistles::LikesController" do
    it "renders turbo_streams corretly if the like is saved" do
      like = FactoryBot.create(:mock_like)
      assign(:like, like)
      flash[:notice] = "Mock notice"

      render 
      expect(rendered).to match_snapshot('create/successful')  
    end

    it "renders turbo_streams correctly if the like is not saved" do
      like = FactoryBot.build(:mock_like, whiistle_id: Whiistle.first.id + 1)
      assign(:like, like)
      flash[:alert] = "Mock alert"

      render 
      expect(rendered).to match_snapshot('create/fail')  
    end
  end

end
