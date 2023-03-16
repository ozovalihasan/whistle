# frozen_string_literal: true

require "rails_helper"

RSpec.describe Header::Logo::Component, type: :component do
  it "renders correctly" do

    render_inline( described_class.new )

    expect_snapshot_match  
  end
end
