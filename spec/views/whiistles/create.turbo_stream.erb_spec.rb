# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/create.turbo_stream' do
  describe 'renders the create turbo stream view of WhiistlesController' do
    context 'if the whiistle is saved successfully' do
      it 'renders correctly' do
        assign(:whiistle, whiistle)

        whiistles_size = 111
        assign(:whiistles_size, whiistles_size)

        completed_successfully = true
        assign(:completed_successfully, completed_successfully)

        assign(:current_user_presenter, current_user_presenter)

        flash[:notice] = 'mock_notice_message'

        render

        expect_snapshot_match('successful')
        expect(rendered).to include('turbo-stream action="update" target="modal_body"')
        expect(rendered).to include('action="replace" target="whiistles_counter"')
        expect(rendered).to include('Whiistles::Container::Component()')
        expect(rendered).to include('Whiistles::MainWhiistle::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Whiistles::WhiistlesCounter::Component(whiistles_count: Integer)')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
        expect(rendered).to include('::Component').exactly(4).times
      end
    end

    context 'if the whiistle is not saved' do
      it 'renders correctly' do
        completed_successfully = false
        assign(:completed_successfully, completed_successfully)

        flash[:alert] = 'mock_alarm_message'

        render

        expect_snapshot_match('fail')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: NilClass, alert: String)')
        expect(rendered).to include('::Component').exactly(1).times
      end
    end
  end
end
