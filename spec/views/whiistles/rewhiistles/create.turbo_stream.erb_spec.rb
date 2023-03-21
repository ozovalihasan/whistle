# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/rewhiistles/create.turbo_stream', type: :view do
  describe 'renders the create turbo stream view of Whiistles::RewhiistlesController' do
    context 'if the whiistle is saved successfully' do
      it 'renders correctly' do
        FactoryBot.create(:mock_user)
        FactoryBot.create(:mock_whiistle)
        rewhiistle = FactoryBot.create(:mock_rewhiistle)
        assign(:rewhiistle, rewhiistle)

        flash[:notice] = 'mock_notice_message'

        render

        expect_snapshot_match('successful')
        expect(rendered).to include('Whiistles::DestroyRewhiistleButton::Component(rewhiistle: Rewhiistle)')
        expect(rendered).to include('StreamAnimations::UpdateAll::Component(targets: String)')
        expect(rendered).to include('Whiistles::DestroyRewhiistleOrQuoteButton::Component(whiistle: Whiistle)')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
        expect(rendered).to include('::Component').exactly(4).times
      end
    end

    context 'if the whiistle is not saved' do
      it 'renders correctly' do
        FactoryBot.create(:mock_user)
        FactoryBot.create(:mock_whiistle)
        rewhiistle = FactoryBot.build(:mock_rewhiistle, user_id: -1)
        assign(:rewhiistle, rewhiistle)

        flash[:notice] = 'mock_alarm_message'

        render

        expect_snapshot_match('fail')
        expect(rendered).to include('Streams::UpdateFlashes::Component(notice: String, alert: NilClass)')
        expect(rendered).to include('::Component').exactly(1).times
      end
    end
  end
end
