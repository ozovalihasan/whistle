# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::PaginatedWhiistlesComponent, type: :component do
  it "renders correctly" do

    mock_components([
      Shared::InfiniteScrollComponent,
      Whiistles::WhiistlesCounterComponent,
      Whiistles::ListWhiistlesComponent
    ])
    
    user = FactoryBot.create(:mock_user)
    cur_user = FactoryBot.create(:mock_user)
    current_user_presenter = CurrentUserPresenter.new(cur_user)

    FactoryBot.create(:mock_whiistle)
    all_whiistles = Whiistle.all
    paginated_whiistles = PaginateWhiistles.new(all_whiistles, 1, "")
    paginated_whiistles.set_basic
    
    render_inline(described_class.new(paginated_whiistles: paginated_whiistles, current_user_presenter: current_user_presenter))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include "Shared::InfiniteScrollComponent(paginated_records: PaginateWhiistles)"
    expect(rendered_content).to include "Whiistles::WhiistlesCounterComponent(whiistles_count: Integer)"
    expect(rendered_content).to include "Whiistles::ListWhiistlesComponent(whiistles: ActiveRecord::Relation, current_user_presenter: CurrentUserPresenter)"
  end
end
