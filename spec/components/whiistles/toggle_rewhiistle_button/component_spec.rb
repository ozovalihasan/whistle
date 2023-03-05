# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ToggleRewhiistleButton::Component, type: :component do
  before(:each) {
    FactoryBot.reload
  }
  
  context "if the whiistle is rewhiistled" do
    it "renders correctly" do

      mock_components([
        Whiistles::DestroyRewhiistleButton::Component
      ])
      
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      FactoryBot.create(:mock_rewhiistle)
      
      current_user_presenter = CurrentUserPresenter.new(user)
      
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot('rewhiistled')  
      expect(rendered_content).to match "Whiistles::DestroyRewhiistleButton::Component"
    end
  end

  context "if the whiistle is not rewhiistled" do
    it "renders correctly" do

      mock_components([
        Whiistles::CreateRewhiistleButton::Component
      ])
      
      user = FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      
      current_user_presenter = CurrentUserPresenter.new(user)
      
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot('not_rewhiistled')  
      expect(rendered_content).to match "Whiistles::CreateRewhiistleButton::Component"
    end
  end
end
