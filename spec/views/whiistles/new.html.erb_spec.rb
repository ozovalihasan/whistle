require 'rails_helper'

RSpec.describe "whiistles/new", type: :view do
  
  describe "renders the new view of WhiistlesController" do
    let(:cur_user) do
      FactoryBot.create(:mock_user)
    end

    it "renders correctly" do
      FactoryBot.create(:mock_user)
      whiistle = Whiistle.new
      assign(:whiistle, whiistle)
      
      sign_in cur_user

      render 

      expect_snapshot_match
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include("Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, enable_quoting_whiistle: TrueClass, enable_adding_floods: TrueClass)")
    end
  end

end
