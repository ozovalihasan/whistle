# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::LikeButtonComponent, type: :component do
  before(:each) do
    FactoryBot.reload
  end
  
  context "if the current user likes the whiistle" do
    it "renders correctly" do

      mock_components([
        Whiistles::DestroyLikeButtonComponent
      ])

      current_user = FactoryBot.create(:mock_user)
      
      whiistle = FactoryBot.create(:mock_whiistle)
      FactoryBot.create(:mock_like)
      current_user_presenter = CurrentUserPresenter.new(current_user)
     
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot("user_likes_whiistle")  
      expect(rendered_content).to include "Whiistles::DestroyLikeButtonComponent(like: Like)"
      expect(rendered_content).to match(/like_button_whiistle_\d+/)
    end
  end
  
  context "if the current user doesn't like the whiistle" do
    it "renders correctly" do

      mock_components([
        Whiistles::CreateLikeButtonComponent
      ])
      
      current_user = FactoryBot.create(:mock_user)
      
      whiistle = FactoryBot.create(:mock_whiistle)
      current_user_presenter = CurrentUserPresenter.new(current_user)
     
      
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot("user_not like_whiistle")  
      expect(rendered_content).to include "Whiistles::CreateLikeButtonComponent(whiistle: Whiistle)"
    end
  end
end
