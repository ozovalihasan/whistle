require 'rails_helper'

RSpec.describe "users/medias/index.turbo_stream", type: :view do
  
  describe "renders the index(turbo_stream) view of Users::MediasController" do

    let(:current_user_presenter) do
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    end

    it "renders correctly" do
      FactoryBot.create(:mock_user)
      FactoryBot.create_pair(:mock_whiistle, user: User.first)
      
      paginate_whiistles = PaginateWhiistles.new(Whiistle.all, 1, nil)
      paginate_whiistles.set_basic

      assign(:paginate_whiistles, paginate_whiistles)
      assign(:current_user_presenter, current_user_presenter)

      render

      expect(rendered).to match_snapshot('index_turbo_stream')
      expect(rendered).to include('turbo-stream action="append" target="pagination-body"')
      expect(rendered).to include('Whiistles::ListWhiistles::Component(whiistles: ActiveRecord::Relation, current_user_presenter: CurrentUserPresenter)')

    end
  end

end
