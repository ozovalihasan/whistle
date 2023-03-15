# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ListWhiistlesForWhiistlesIndexPage::Component, type: :component do

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:create_whiistle) do
    FactoryBot.create(:mock_whiistle, user: user)
  end

  let(:cur_user) do
    FactoryBot.create(:mock_user)
  end
  
  context "if the whiistle is a reply and has a label 'primary_whiistle' " do 
    it "renders correctly" do
      
      create_whiistle
      FactoryBot.create(:mock_reply, user: user)

      all_whiistles = Reply.select(" *, 'primary_whiistle' AS label ")
      paginate_whiistles = PaginateWhiistles.new(all_whiistles, 1, "", cur_user)
    
      render_inline( described_class.new( paginate_whiistles: paginate_whiistles ) )
      
      expect(rendered_content).to match_custom_snapshot("with_reply")
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to include "Whiistles::Whiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)"
      expect(rendered_content).to match /mock_fullname_\d+ replied/
    end
  end
  
  context "if the whiistle is not a reply or doesn't have a label 'primary_whiistle'" do 
    it "renders correctly" do
      
      create_whiistle      
      all_whiistles = Whiistle.select(" *, '' AS label ")
      paginate_whiistles = PaginateWhiistles.new(all_whiistles, 1, "", cur_user)
    
      render_inline( described_class.new( paginate_whiistles: paginate_whiistles ) )

      expect(rendered_content).to match_custom_snapshot("without_reply")
      expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
    end
  end

end
