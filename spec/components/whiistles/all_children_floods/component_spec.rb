# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::AllChildrenFloods::Component, type: :component do
  context "if the flood doesn't have another flood" do
    it "renders correctly" do

      mock_components([
        Whiistles::Whiistle::Component
      ])

      user = FactoryBot.create(:mock_user)
      cur_user = FactoryBot.create(:mock_user)
      current_user_presenter = CurrentUserPresenter.new(cur_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      flood = FactoryBot.create(:mock_flood, whiistle: whiistle)
      
      render_inline(described_class.new(flood: flood, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot("without_children_floods")  
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)"
    end
  end

  context "if the flood doesn't have another flood" do
    it "renders correctly" do

      mock_components([
        Whiistles::Whiistle::Component
      ])

      user = FactoryBot.create(:mock_user)
      cur_user = FactoryBot.create(:mock_user)
      current_user_presenter = CurrentUserPresenter.new(cur_user)

      whiistle = FactoryBot.create(:mock_whiistle)
      flood = FactoryBot.create(:mock_flood, whiistle: whiistle)
      flood2 = FactoryBot.create(:mock_flood, whiistle: flood, user: user)
      
      render_inline(described_class.new(flood: flood, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot("with_children_floods")  
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)").exactly(2).times
    end
  end
end
