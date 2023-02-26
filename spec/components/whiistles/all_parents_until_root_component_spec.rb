# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::AllParentsUntilRootComponent, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::WhiistleComponent
    ])
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(user)
  end
  
  context "if the whiistle's parent is a flood" do
    it "renders correctly" do
      
      FactoryBot.create(:mock_whiistle, user: user)
      FactoryBot.create_list(:mock_flood, 2, user: user)
      flood = Flood.last
      
      render_inline(described_class.new(whiistle: flood.whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_snapshot('AllParentsUntilRootComponent_with_flood')
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Flood, current_user_presenter: CurrentUserPresenter)"
    end
  end
  
  context "if the whiistle's parent is a reply" do
    it "renders correctly" do
      
      FactoryBot.create(:mock_whiistle, user: user)
      FactoryBot.create_list(:mock_reply, 2, user: user)
      reply = Reply.last
      
      render_inline(described_class.new(whiistle: reply.whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_snapshot('AllParentsUntilRootComponent_with_reply')
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Reply, current_user_presenter: CurrentUserPresenter)"
    end
  end

  context "if the whiistle's parent is a reply and its grandparent is a flood" do
    it "renders correctly" do
      
      FactoryBot.create(:mock_whiistle, user: user)
      grandparent = FactoryBot.create(:mock_flood, user: user)
      parent_reply = FactoryBot.create(:mock_reply, whiistle: grandparent, user: user)
      FactoryBot.create(:mock_reply, whiistle: parent_reply, user: user)
      reply = Reply.last
      
      render_inline(described_class.new(whiistle: reply.whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_snapshot('AllParentsUntilRootComponent_with_flood_and_reply')
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Flood, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::WhiistleComponent(whiistle: Reply, current_user_presenter: CurrentUserPresenter)"
    end
  end

end
