# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ListWhiistles::Component, type: :component do

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:cur_user) do
    FactoryBot.create(:mock_user)
  end

  it "renders correctly" do
    
    FactoryBot.create(:mock_whiistle, user: user)
    FactoryBot.create(:mock_flood, user: user)
    FactoryBot.create(:mock_reply, user: user)

    paginate_whiistles = PaginateWhiistles.new(BaseWhiistle.all, 1, "", cur_user)
    
    render_inline( described_class.new( paginate_whiistles: paginate_whiistles ) )

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Flood, current_user_presenter: CurrentUserPresenter)"
    expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Reply, current_user_presenter: CurrentUserPresenter)"
    expect(rendered_content).to include "Whiistles::WhiistleWithFloodInfo::Component(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
  end
end
