require 'rails_helper'

RSpec.describe "users/whiistles/create.turbo_stream", type: :view do
  
  describe "renders the create(turbo_stream) view of Users::WhiistlesController" do
    
    context "if whiistle is saved successfully" do
      
      let(:current_user_presenter) do
        cur_user = FactoryBot.create(:mock_user)
        CurrentUserPresenter.new(cur_user)
      end

      it "renders correctly" do

        status = double('status', success?: true) 
        assign(:status, status)

        assign(:current_user_presenter, current_user_presenter)
        whiistle = FactoryBot.create(:mock_whiistle)      
        assign(:whiistle, whiistle)

        flash[:notice] = "mock_notice"

        render

        expect(rendered).to match_custom_snapshot('successful')
        expect(rendered).to include('turbo-stream action="update" target="modal_body"')
        expect(rendered).to include('Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
      end
    end

    context "if whiistle is not saved" do
      it "renders correctly" do

        status = double('status', success?: false) 
        assign(:status, status)

        flash[:alert] = "mock_notice"

        render

        expect(rendered).to match_custom_snapshot('unsuccessful')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: NilClass, alert: String)')
      end
    end
  end

end
