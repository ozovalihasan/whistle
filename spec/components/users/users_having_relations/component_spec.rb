# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UsersHavingRelations::Component, type: :component do
  let(:user) do
    FactoryBot.create(:mock_user)
  end

  context 'the paginated users is not empty' do
    it 'renders correctly' do
      FactoryBot.create_list(:mock_user, 3)

      cur_user = User.last
      page = 1
      url = 'mock_url'
      original_records = User.all.limit(2)
      paginate_users = PaginateUsers.new(original_records, page, url, cur_user)

      tab_presenter = UsersTabPresenter.new(user, :followers, paginate_users)

      render_inline(described_class.new(tab_presenter:))

      expect_snapshot_match('not_empty_users')
      expect(rendered_content).to include 'Users::PaginateUsers::Component(paginate_users: PaginateUsers)'
      expect(rendered_content).to include('::Component').exactly(1).times
    end
  end

  context 'the paginated users is empty' do
    it 'renders correctly' do
      FactoryBot.create(:mock_user)

      cur_user = User.last
      page = 1
      url = 'mock_url'
      original_empty_records = User.where(id: -1)
      paginate_users = PaginateUsers.new(original_empty_records, page, url, cur_user)
      tab_presenter = UsersTabPresenter.new(user, :followers, paginate_users)

      render_inline(described_class.new(tab_presenter:))

      expect_snapshot_match('empty_users')
      expect(CGI.unescapeHTML(rendered_content)).to match "mock_fullname_2 doesn't have any follower."
      expect(rendered_content).to include('::Component').exactly(0).times
    end
  end
end
