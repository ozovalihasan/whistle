# frozen_string_literal: true

require "rails_helper"

RSpec.describe Streams::UpdateFlashesComponent, type: :component do
  it "renders correctly" do
    mock_components([
      Layout::NoticeComponent,
      Layout::AlertComponent
    ])

    render_inline( described_class.new(alert: "mock_alert", notice: "mock_notice") )

    expect(rendered_content).to match_snapshot('UpdateFlashesComponent')  
    expect(rendered_content).to match(/Layout::NoticeComponent/)
    expect(rendered_content).to match(/Layout::AlertComponent/)
    expect(rendered_content).to match(/turbo-stream/)
    expect(rendered_content).to match(/action="update"/)
    
  end
end
