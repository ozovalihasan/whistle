# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ListWhiistlesForWhiistlesIndexPage::Component, type: :component do

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
  
  context "if the whiistle is a reply and has a label 'primary_whiistle' " do 
    it "renders correctly" do
      
      create_whiistle
      FactoryBot.create(:mock_reply, user: user)

      whiistles = Reply.select(" *, 'primary_whiistle' AS label ")
      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )
      
      expect_snapshot_match("with_reply")
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to match /mock_fullname_\d+ replied/
    end
  end
  
  context "if the whiistle is not a reply or doesn't have a label 'primary_whiistle'" do 
    it "renders correctly" do
      
      create_whiistle      
      whiistles = Whiistle.select(" *, '' AS label ")
    
      render_inline( described_class.new( whiistles: whiistles, current_user_presenter: current_user_presenter ) )

      expect_snapshot_match("without_reply")
      expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
    end
  end

end
