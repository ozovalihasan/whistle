# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::PaginateWhiistles::Component, type: :component do
  it "renders correctly" do
    user = FactoryBot.create(:mock_user)
    cur_user = FactoryBot.create(:mock_user)

    FactoryBot.create(:mock_whiistle)
    all_whiistles = Whiistle.all
    paginate_whiistles = PaginateWhiistles.new(all_whiistles, 1, "", cur_user)
    paginate_whiistles.set_basic
    
    render_inline(described_class.new(paginate_whiistles: paginate_whiistles))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "Shared::InfiniteScroll::Component(paginate_records: PaginateWhiistles)"
    expect(rendered_content).to include "Whiistles::WhiistlesCounter::Component(whiistles_count: Integer)"
    expect(rendered_content).to include "Whiistles::ListPaginatedWhiistles::Component(paginate_whiistles: PaginateWhiistles)"
  end
end
