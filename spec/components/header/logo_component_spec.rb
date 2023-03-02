# frozen_string_literal: true

require "rails_helper"

RSpec.describe Header::LogoComponent, type: :component do
  it "renders correctly" do

    render_inline( described_class.new )

    expect(rendered_content).to match_custom_snapshot  
  end
end
