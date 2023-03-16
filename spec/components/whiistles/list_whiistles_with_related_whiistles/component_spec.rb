# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ListWhiistlesWithRelatedWhiistles::Component, type: :component do
  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:create_whiistle) do
    FactoryBot.create(:mock_whiistle, user: user)
  end

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(user)
  end
  
  context "if the whiistle has a label 'shared_whiistle' " do 
    it "renders correctly" do
      
      create_whiistle

      whiistles = BaseWhiistle.select(" *, 'shared_whiistle' AS label ")

      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect(rendered_content).to match_custom_snapshot('with_shared_whiistle')
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter, show_flood_info: TrueClass)"
      
    end
  end
  
  context "if the whiistle is a Whiistle and has a label 'primary_whiistle' " do 
    it "renders correctly" do
      
      create_whiistle

      whiistles = Whiistle.select(" *, 'primary_whiistle' AS label ")

      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect(rendered_content).to match_custom_snapshot('with_primary_whiistle_and_is_a_whiistle')
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      
    end
  end

  context "if the whiistle is a Whiistle and has a label 'primary_whiistle' and a flood" do 
    it "renders correctly" do
      
      create_whiistle
      FactoryBot.create(:mock_flood, user: user)

      whiistles = Whiistle.select(" *, 'primary_whiistle' AS label ")

      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect(rendered_content).to match_custom_snapshot('with_primary_whiistle_and_flood_and_is_a_whiistle')
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::MinifiedFloods::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      
    end
  end

  context "if the whiistle is a Reply and has a label 'primary_whiistle' and its path is 2 or more" do 
    it "renders correctly" do
      
      create_whiistle
      reply = FactoryBot.create(:mock_reply, user: user)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ").where(id: reply.id)

      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect(rendered_content).to match_custom_snapshot('with_primary_whiistle_and_2_or_more_and_is_a_reply')
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)").exactly(1).times
      
    end
  end
  
  context "if the whiistle is a Reply and has a label 'primary_whiistle' and its path is 3 or more" do 
    it "renders correctly" do
      
      create_whiistle
      FactoryBot.create(:mock_reply, user: user)
      reply = FactoryBot.create(:mock_reply, user: user)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ").where(id: reply.id)

      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect(rendered_content).to match_custom_snapshot('with_primary_whiistle_and_3_or_more_and_is_a_reply')
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)").exactly(2).times
      
    end
  end
  
  context "if the whiistle is a Reply and has a label 'primary_whiistle' and its path is 4 or more" do 
    it "renders correctly" do
      
      create_whiistle
      FactoryBot.create(:mock_reply, user: user)
      FactoryBot.create(:mock_reply, user: user)
      reply = FactoryBot.create(:mock_reply, user: user)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ").where(id: reply.id)

      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect(rendered_content).to match_custom_snapshot('with_primary_whiistle_and_4_or_more_and_is_a_reply')
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include("Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)").exactly(2).times
      expect(rendered_content).to include("Show more replies")
      expect(rendered_content).to match(/\/whiistles\/#{Whiistle.first.id}/)
      
    end
  end
  
end
