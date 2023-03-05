# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::Whiistle::Component, type: :component do
  let(:current_user_presenter) {
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(cur_user)
  }
  
  let(:whiistle) {
    FactoryBot.create(:mock_user)
    FactoryBot.create(:mock_whiistle)
  }
  
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::RewhiistleInfo::Component,
      Whiistles::LikeInfo::Component,
      Users::ProfileImageButton::Component,
      Whiistles::UserNamesWithTimestamp::Component,
      Whiistles::ReplyInfo::Component,
      Whiistles::BodyAndPictures::Component,
      Whiistles::Buttons::Component,
      Whiistles::FloodInfo::Component
    ])
  end

  let(:expect_mandatory_components) {
    expect(rendered_content).to include "Whiistles::RewhiistleInfo::Component"
    expect(rendered_content).to include "Whiistles::LikeInfo::Component"
    expect(rendered_content).to include "Users::ProfileImageButton::Component"
    expect(rendered_content).to include "Whiistles::UserNamesWithTimestamp::Component"
    expect(rendered_content).to include "Whiistles::ReplyInfo::Component"
    expect(rendered_content).to include "Whiistles::BodyAndPictures::Component"
    expect(rendered_content).to include "Whiistles::Buttons::Component"
  }
  
  context "if it is not necessary to show the flood info" do
    it "renders correctly" do

      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot("without_flood_info")  
      expect_mandatory_components
    end
  end
  
  context "if it is necessary to show the flood info" do
    it "renders correctly" do
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter, show_flood_info: true))

      expect(rendered_content).to match_custom_snapshot("with_flood_info")  
      expect_mandatory_components
      expect(rendered_content).to include "Whiistles::FloodInfo::Component"
    end
  end
end
