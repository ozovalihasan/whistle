# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/show' do
  describe 'renders the show view of WhiistlesController' do
    let(:sidebar_right_presenter) do
      SidebarRightPresenter.new(whiistle.user, cur_user)
    end

    it 'renders correctly' do
      assign(:whiistle, whiistle)

      assign(:sidebar_right_presenter, sidebar_right_presenter)

      assign(:current_user_presenter, current_user_presenter)

      render

      expect_snapshot_match
      expect(rendered).to include('Whiistles::MainWhiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)')
      expect(rendered).to include('Users::SidebarRight::Component(sidebar_right_presenter: SidebarRightPresenter)')
      expect(rendered).to include('::Component').exactly(3).times
    end

    context 'if whiistle has replies' do
      it 'renders correctly' do
        assign(:whiistle, whiistle)
        create(:mock_reply)

        assign(:sidebar_right_presenter, sidebar_right_presenter)

        assign(:current_user_presenter, current_user_presenter)

        render

        expect_snapshot_match('with_replies')
        expect(rendered).to include('Whiistles::MainWhiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Whiistles::ListWhiistles::Component(whiistles: ActiveRecord::Associations::CollectionProxy, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Users::SidebarRight::Component(sidebar_right_presenter: SidebarRightPresenter)')
        expect(rendered).to include('::Component').exactly(4).times
      end
    end
  end
end
