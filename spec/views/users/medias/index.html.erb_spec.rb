require 'rails_helper'

RSpec.describe "users/medias/index", type: :view do
  
  describe "renders the index view of Users::MediasController" do
    it "renders correctly" do
      FactoryBot.reload
      user = FactoryBot.create(:mock_user)
      assign(:user, user)

      user2 = FactoryBot.create(:mock_user)

      travel_to(Time.new(2000, 1, 1, 1, 1, 1)) do
        whiistle = FactoryBot.create(:mock_whiistle, user: user2)
        whiistle.pictures.attach(
          [
            io: File.open(Rails.root.join('app', 'assets', 'images', 'mock-1.jpg')), 
            filename: 'mock-1.jpg', 
            content_type: 'image/jpeg'
          ]
        )
      end

      all_whiistles = user2.whiistles.joins(:pictures_attachments).distinct.descending_order
      paginated_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], whiistles_url)
      paginated_whiistles.set_basic
      assign(:paginated_whiistles, paginated_whiistles)

      suggested_users = user.suggested_users
      assign(:suggested_users, suggested_users)

      sign_in user

      travel_to(Time.new(2001, 1, 1, 1, 1, 1)) do
        render
      end

      expect(rendered).to match_snapshot('index')
      expect(rendered).to include('mock_body_whiistle_1').exactly(1).times
    end
  end

end
