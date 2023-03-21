# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/quoted_whiistles/new', type: :view do
  describe 'renders the new view of Whiistles::QuotedWhiistlesController' do
    let(:cur_user) do
      FactoryBot.create(:mock_user)
    end

    it 'renders correctly' do
      FactoryBot.create(:mock_user)
      quoted_whiistle = FactoryBot.create(:mock_whiistle)
      assign(:quoted_whiistle, quoted_whiistle)

      quoting_whiistle = Whiistle.new
      assign(:quoting_whiistle, quoting_whiistle)

      sign_in cur_user

      render

      expect_snapshot_match
      expect(rendered).to match 'turbo-frame id="modal_body"'
      expect(rendered).to include('Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, quoted_whiistle: Whiistle)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
