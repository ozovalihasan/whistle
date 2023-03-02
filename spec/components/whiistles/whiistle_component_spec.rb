# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::WhiistleComponent, type: :component do
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
      Whiistles::RewhiistleInfoComponent,
      Whiistles::LikeInfoComponent,
      Users::ProfileImageButtonComponent,
      Whiistles::UserNamesWithTimestampComponent,
      Whiistles::ReplyInfoComponent,
      Whiistles::BodyAndPicturesComponent,
      Whiistles::ButtonsComponent,
      Whiistles::FloodInfoComponent
    ])
  end

  let(:expect_mandatory_components) {
    expect(rendered_content).to include "Whiistles::RewhiistleInfoComponent"
    expect(rendered_content).to include "Whiistles::LikeInfoComponent"
    expect(rendered_content).to include "Users::ProfileImageButtonComponent"
    expect(rendered_content).to include "Whiistles::UserNamesWithTimestampComponent"
    expect(rendered_content).to include "Whiistles::ReplyInfoComponent"
    expect(rendered_content).to include "Whiistles::BodyAndPicturesComponent"
    expect(rendered_content).to include "Whiistles::ButtonsComponent"
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
      expect(rendered_content).to include "Whiistles::FloodInfoComponent"
    end
  end
end
