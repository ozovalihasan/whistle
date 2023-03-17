require 'rails_helper'

RSpec.describe "users/whiistles/new", type: :view do
  
  describe "renders the new view of Users::WhiistlesController" do

    let(:cur_user) { 
      FactoryBot.create(:mock_user)
    }

    let(:user) { 
      FactoryBot.create(:mock_user)
    }
  
    it "renders correctly" do
    
      whiistle = Whiistle.new
      assign(:whiistle, whiistle)

      assign(:user, user)

      sign_in cur_user

      render

      expect_snapshot_match
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include('Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, value: String)')

    end
    
  end

end
