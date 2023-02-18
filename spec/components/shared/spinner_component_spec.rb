# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::SpinnerComponent, type: :component do
  it "renders correctly" do
    render_inline(described_class.new())

    expect(rendered_content).to match_snapshot('SpinnerComponent')  
  end
end
