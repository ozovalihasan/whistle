# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::MinifiedFloods::Component, type: :component do

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

      expect_snapshot_match("three_or_more")
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(2).times
      expect(rendered_content).to include "Whiistles::FloodInfo::Component(whiistle: Whiistle)"
      expect(rendered_content).to include("::Component").exactly(3).times
    end
  end

  context "if the whiistle has two floods" do
    it "renders correctly" do
      initialize_models
      FactoryBot.create_list(:mock_flood, 2, user: user)
      
      render_component

      expect_snapshot_match("two")
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(2).times
      expect(rendered_content).not_to include "Whiistles::FloodInfo::Component(whiistle: Whiistle)"
      expect(rendered_content).to include("::Component").exactly(2).times
    end
  end

  context "if the whiistle has only one flood" do
    it "renders correctly" do
      initialize_models
      FactoryBot.create(:mock_flood, user: user)
      
      render_component

      expect_snapshot_match("one")
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(1).times
      expect(rendered_content).not_to include "Whiistles::FloodInfo::Component(whiistle: Whiistle)"
      expect(rendered_content).to include("::Component").exactly(1).times
    end
  end
end
