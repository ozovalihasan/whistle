# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ListWhiistles::Component, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::WhiistleWithFloodInfo::Component
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
    
    FactoryBot.create(:mock_whiistle, user: user)
    FactoryBot.create(:mock_flood, user: user)
    FactoryBot.create(:mock_reply, user: user)
    
    render_inline(described_class.new(whiistles: BaseWhiistle.all, current_user_presenter: current_user_presenter))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)"
    expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)"
    expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
  end
end
