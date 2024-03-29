# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::ListPaginatedWhiistles::Component, type: :component do
  it 'renders correctly' do
    whiistle

    paginate_whiistles = PaginateWhiistles.new(BaseWhiistle.all, 1, '', cur_user)
    paginate_whiistles.set_basic

    render_inline(described_class.new(paginate_whiistles:))

    expect_snapshot_match
    expect(rendered_content).to include 'Whiistles::ListWhiistles::Component(whiistles: ActiveRecord::Relation, current_user_presenter: CurrentUserPresenter)'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
