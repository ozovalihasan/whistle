require 'rails_helper'

RSpec.describe "users/whiistles/new", type: :view do
  
  describe "renders the new view of Users::WhiistlesController" do

    let(:current_user_presenter) { 
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    }
  
    it "renders correctly" do
    

      whiistle = Whiistle.new
      assign(:whiistle, whiistle)

      assign(:current_user_presenter, current_user_presenter)

      sign_in current_user_presenter.current_user

      user = FactoryBot.create(:mock_user)
      assign(:user, user)
      
      render

      expect(rendered).to match_custom_snapshot
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include('Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, current_user_presenter: CurrentUserPresenter, value: String)')

    end
    
  end

end
