# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::QuotedWhiistleButton::Component, type: :component do
  it 'renders correctly' do
    render_inline(described_class.new(whiistle:))

    expect_snapshot_match
    expect(rendered_content).to include 'data-action="modal#openAndVisit"'
    expect(rendered_content).to match(%r{href="/whiistles/\d+/quoted_whiistle/new"})
    expect(rendered_content).to include 'Whiistles::ButtonInner::Component()'
    expect(rendered_content).to match 'Quoted Whiistle'
    expect(rendered_content).to include('::Component').exactly(1).times
  end
end
