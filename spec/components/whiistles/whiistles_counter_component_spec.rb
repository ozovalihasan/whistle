# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::WhiistlesCounterComponent, type: :component do
  context "if the count of whiistles is 1" do

    it "renders correctly" do
      render_inline(described_class.new(whiistles_count: 1))

      expect(rendered_content).to match_custom_snapshot('count_equal_one')  
      expect(rendered_content).to match "1 Whiistle"
    end
    
  end

  context "if the count of whiistles is greater than 1" do

    it "renders correctly" do
      render_inline(described_class.new(whiistles_count: 111))

      expect(rendered_content).to match_custom_snapshot('count_greater_than_one')  
      expect(rendered_content).to match "111 Whiistles"
    end
    
  end
end
