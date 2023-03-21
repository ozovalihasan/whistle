# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whiistles/replies/new', type: :view do
  describe 'renders the new view of Whiistles::RepliesController' do
    it 'renders correctly' do
      FactoryBot.create(:mock_user)
      assign(:whiistle, whiistle)

      reply = @reply = Reply.new
      assign(:reply, reply)

      sign_in cur_user

      render

      expect_snapshot_match
      expect(rendered).to match 'turbo-frame id="modal_body"'
      expect(rendered).to include('Users::ProfileImageButton::Component(user: User)')
      expect(rendered).to include('Whiistles::UserNamesWithTimestamp::Component(whiistle: Whiistle)')
      expect(rendered).to include('Whiistles::BodyAndPictures::Component(whiistle: Whiistle, show_pictures: FalseClass)')
      expect(rendered).to include('Whiistles::ReplyInfo::Component(whiistle: Whiistle)')
      expect(rendered).to include('Whiistles::Form::Component(form_url: String, whiistle: Reply, label: String, cur_user: User, enable_quoting_whiistle: TrueClass)')
      expect(rendered).to include('::Component').exactly(5).times
    end
  end
end
