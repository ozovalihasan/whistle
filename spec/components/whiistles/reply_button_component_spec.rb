# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ReplyButtonComponent, type: :component do
  it "renders 'Show this thread' link " do
    FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)
    
    render_inline(described_class.new(whiistle: whiistle))

    expect(rendered_content).to match_snapshot('ReplyButtonComponent')  
    expect(rendered_content).to match /<a (.|\n)*0(.|\n)*<\/a>/
  end
end
