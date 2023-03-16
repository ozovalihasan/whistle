require 'rails_helper'

RSpec.describe "whiistles/quoted_whiistles/new", type: :view do
  
  describe "renders the new view of Whiistles::QuotedWhiistlesController" do

    let(:current_user_presenter) do
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    end

    it "renders correctly" do
      FactoryBot.create(:mock_user)
      quoted_whiistle = FactoryBot.create(:mock_whiistle)
      assign(:quoted_whiistle, quoted_whiistle)
      
      quoting_whiistle = Whiistle.new
      assign(:quoting_whiistle, quoting_whiistle)

      assign(:current_user_presenter, current_user_presenter)

      render 

      expect_snapshot_match
      expect(rendered).to match 'turbo-frame id="quoting_whiistle_whiistle_\d*"'
      expect(rendered).to include("Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, current_user_presenter: CurrentUserPresenter, quoted_whiistle: Whiistle)")
    end
  end

end
