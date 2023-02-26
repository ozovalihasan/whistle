# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::MinifiedFloodsComponent, type: :component do
  before(:each) do
    FactoryBot.reload

    mock_components([
      Whiistles::FloodInfoComponent,
      Whiistles::WhiistleComponent
    ])
  end

  let(:current_user_presenter) { 
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(cur_user)
   }

  let(:whiistle) { 
    FactoryBot.create(:mock_whiistle)
   }
  
  let(:user) {
    FactoryBot.create(:mock_user)
  }

  let(:initialize_models) {
    user
    whiistle
  }

  let(:render_component) {
    render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))
  }
  
   
  context "if the whiistle has three or more floods" do
    it "renders correctly" do
      initialize_models
      FactoryBot.create_list(:mock_flood, 3, user: user)
      
      render_component

      expect(rendered_content).to match_snapshot('MinifiedFloodsComponent_three_or_more')
      expect(rendered_content).to include("Whiistles::WhiistleComponent(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(2).times
      expect(rendered_content).to include "Whiistles::FloodInfoComponent(whiistle: Whiistle)"
    end
  end

  context "if the whiistle has two floods" do
    it "renders correctly" do
      initialize_models
      FactoryBot.create_list(:mock_flood, 2, user: user)
      
      render_component

      expect(rendered_content).to match_snapshot('MinifiedFloodsComponent_two')
      expect(rendered_content).to include("Whiistles::WhiistleComponent(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(2).times
      expect(rendered_content).not_to include "Whiistles::FloodInfoComponent(whiistle: Whiistle)"
    end
  end

  context "if the whiistle has only one flood" do
    it "renders correctly" do
      initialize_models
      FactoryBot.create(:mock_flood, user: user)
      
      render_component

      expect(rendered_content).to match_snapshot('MinifiedFloodsComponent_one')
      expect(rendered_content).to include("Whiistles::WhiistleComponent(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(1).times
      expect(rendered_content).not_to include "Whiistles::FloodInfoComponent(whiistle: Whiistle)"
    end
  end
end
