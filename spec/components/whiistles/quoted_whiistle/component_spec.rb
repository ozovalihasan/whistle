# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::QuotedWhiistle::Component, type: :component do
  it 'renders correctly' do
    whiistle
    quoting_whiistle = create(:mock_quoting_whiistle)

    render_inline(described_class.new(whiistle: quoting_whiistle))

    expect_snapshot_match
    expect(rendered_content).to match 'Users::ProfileImageButtonSmall::Component'
    expect(rendered_content).to match 'Whiistles::UserNamesWithTimestamp::Component'
    expect(rendered_content).to match 'Whiistles::BodyAndPictures::Component'
    expect(rendered_content).to match 'Whiistles::FloodInfo::Component'
  end
end
