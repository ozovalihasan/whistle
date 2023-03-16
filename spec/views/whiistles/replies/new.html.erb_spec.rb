require 'rails_helper'

RSpec.describe "whiistles/replies/new", type: :view do
  
  describe "renders the new view of Whiistles::RepliesController" do
    let(:current_user_presenter) do
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    end

    it "renders correctly" do
      FactoryBot.create(:mock_user)
      FactoryBot.create(:mock_whiistle)
      reply = FactoryBot.build(:mock_reply)
      assign(:reply, reply)
      
      quoting_whiistle = Whiistle.new
      assign(:quoting_whiistle, quoting_whiistle)

      assign(:current_user_presenter, current_user_presenter)

      render 

      expect(rendered).to match_custom_snapshot
      expect(rendered).to match 'turbo-frame id="quoting_whiistle_whiistle_\d*"'
      expect(rendered).to include("Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, current_user_presenter: CurrentUserPresenter, quoted_whiistle: Whiistle)")
    end
  end

end
