# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/whiistles/create.turbo_stream' do
  describe 'renders the create(turbo_stream) view of Users::WhiistlesController' do
    context 'if the whiistle is saved successfully' do
      it 'renders correctly' do
        create(:mock_user)

        assign(:whiistle, whiistle)

        completed_successfully = true
        assign(:completed_successfully, completed_successfully)

        assign(:current_user_presenter, current_user_presenter)

        flash[:notice] = 'mock_notice_message'

        render

        expect_snapshot_match('successful')
        expect(rendered).to include('action="update" target="modal_body"')
        expect(rendered).to include('Whiistles::Whiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
        expect(rendered).to include('::Component').exactly(2).times
      end
    end

    context 'if the whiistle is not saved' do
      it 'renders correctly' do
        completed_successfully = false
        assign(:completed_successfully, completed_successfully)

        flash[:notice] = 'mock_alarm_message'

        render

        expect_snapshot_match('fail')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
        expect(rendered).to include('::Component').exactly(1).times
      end
    end
  end
end
