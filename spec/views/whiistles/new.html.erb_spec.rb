require 'rails_helper'

RSpec.describe "whiistles/new", type: :view do
  
  describe "renders the new view of WhiistlesController" do
    let(:current_user_presenter) do
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    end

    it "renders correctly" do
      FactoryBot.create(:mock_user)
      whiistle = Whiistle.new
      assign(:whiistle, whiistle)
      
      assign(:current_user_presenter, current_user_presenter)

      render 

      expect_snapshot_match
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include("Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: NilClass, enable_quoting_whiistle: TrueClass, enable_adding_floods: TrueClass)")
    end
  end

end
