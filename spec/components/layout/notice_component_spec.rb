# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::NoticeComponent, type: :component do
  it "renders correctly" do

    render_inline( described_class.new(notice: "mock_notice") )

    expect(rendered_content).to match_snapshot('NoticeComponent')  
    expect(rendered_content).to match(/mock_notice/)
  end
end
