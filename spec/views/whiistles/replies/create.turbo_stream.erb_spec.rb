# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/replies/create.turbo_stream', type: :view do
  describe 'renders the create turbo stream view of Whiistles::RepliesController' do
    let(:current_user_presenter) do
      cur_user = FactoryBot.create(:mock_user)
      CurrentUserPresenter.new(cur_user)
    end

    context 'if the reply is saved successfully' do
      it 'renders correctly' do
        FactoryBot.create(:mock_user)
        FactoryBot.create(:mock_whiistle)
        reply = FactoryBot.create(:mock_reply)
        assign(:reply, reply)

        assign(:whiistle, reply.whiistle)

        assign(:current_user_presenter, current_user_presenter)

        flash[:notice] = 'mock_notice_message'

        render

        expect_snapshot_match('successful')
        expect(rendered).to include('Whiistles::AllParentsUntilRoot::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Whiistles::MainWhiistle::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Whiistles::WhiistleWithFloodInfo::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
        expect(rendered).to include('::Component').exactly(5).times
      end
    end

    context 'if the whiistle is not saved' do
      it 'renders correctly' do
        FactoryBot.create(:mock_user)
        FactoryBot.create(:mock_whiistle)
        reply = FactoryBot.build(:mock_reply, whiistle: nil)
        assign(:reply, reply)

        flash[:alert] = 'mock_alarm_message'

        render

        expect_snapshot_match('fail')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: NilClass, alert: String)')
        expect(rendered).to include('::Component').exactly(1).times
      end
    end
  end
end
