# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/whiistles/new' do
  describe 'renders the new view of Users::WhiistlesController' do
    it 'renders correctly' do
      whiistle = Whiistle.new
      assign(:whiistle, whiistle)

      assign(:user, user)

      sign_in cur_user

      render

      expect_snapshot_match
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include('Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, value: String)')
      expect(rendered).to include('::Component').exactly(1).times
    end
  end
end
