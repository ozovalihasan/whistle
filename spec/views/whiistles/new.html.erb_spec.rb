# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/new' do
  describe 'renders the new view of WhiistlesController' do
    it 'renders correctly' do
      whiistle = Whiistle.new
      assign(:whiistle, whiistle)

      sign_in cur_user

      render

      expect_snapshot_match
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include('Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, enable_quoting_whiistle: TrueClass, enable_adding_floods: TrueClass)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
