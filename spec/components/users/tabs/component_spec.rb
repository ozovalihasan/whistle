# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Tabs::Component, type: :component do
  let(:expect_mandatory_elements) do
    expect(rendered_content).to include('<turbo-frame data-turbo-action="advance" id="user-tabs" target="_top">')
    expect(rendered_content).to include('Users::TabsButton::Component(url: String, text: String, active_tab: TrueClass)').exactly(1).times
    expect(rendered_content).to include('Users::TabsButton::Component(url: String, text: String, active_tab: FalseClass)').exactly(5).times
    expect(rendered_content).to include('Users::SidebarRight::Component(sidebar_right_presenter: SidebarRightPresenter)')
    expect(rendered_content).to include('<div class="w-2/3">')
    expect(rendered_content).to include('<div class="w-1/3">')
    expect(rendered_content).to include('::Component').exactly(8).times
  end

  context 'if the tab shows whiistles' do
    it 'renders correctly' do
      paginate_whiistles = PaginateWhiistles.new(Whiistle.all, 1, 'mock_url', cur_user)

      tab_presenter = WhiistlesTabPresenter.new(user, :whiistles_without_replies, paginate_whiistles, Whiistle.new)
      sidebar_right_presenter = SidebarRightPresenter.new(user, cur_user)

      render_inline(described_class.new(
                      tab_presenter:,
                      sidebar_right_presenter:
                    ))

      expect_snapshot_match('with_whiistles')
      expect_mandatory_elements
      expect(rendered_content).to include('Users::WhiistlesTab::Component(tab_presenter: WhiistlesTabPresenter)')
    end
  end

  context 'if the tab shows users' do
    it 'renders correctly' do
      paginate_users = PaginateUsers.new(User.all.limit(0), 1, 'mock_url', cur_user)
      tab_presenter = UsersTabPresenter.new(user, :followers, paginate_users)

      sidebar_right_presenter = SidebarRightPresenter.new(user, cur_user)

      current_user_presenter = CurrentUserPresenter.new(cur_user)

      render_inline(described_class.new(
                      tab_presenter:,
                      sidebar_right_presenter:
                    ))

      expect_snapshot_match('with_users')
      expect_mandatory_elements
      expect(rendered_content).to include('Users::UsersHavingRelations::Component(tab_presenter: UsersTabPresenter)')
    end
  end
end
