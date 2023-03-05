# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::Buttons::Component, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::ReplyButton::Component,
      Whiistles::ToggleRewhiistleOrQuoteButton::Component,
      Whiistles::LikeButton::Component
    ])
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(user)
  end
  
  it "renders correctly" do
    
    whiistle = FactoryBot.create(:mock_whiistle, user: user)
    
    render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Whiistles::ReplyButton::Component"
    expect(rendered_content).to include "Whiistles::ToggleRewhiistleOrQuoteButton::Component"
    expect(rendered_content).to include "Whiistles::LikeButton::Component"
    expect(rendered_content).to match /id.*reply_whiistle_\d+/
    expect(rendered_content).to match /id.*quoting_whiistle_whiistle_\d+/
  end
end
