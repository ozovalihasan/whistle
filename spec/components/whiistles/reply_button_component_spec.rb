# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ReplyButtonComponent, type: :component do
  it "renders 'Show this thread' link " do
    FactoryBot.create(:mock_user)
    whiistle = FactoryBot.create(:mock_whiistle)
    FactoryBot.create(:mock_reply)
    whiistle.reload
    
    render_inline(described_class.new(whiistle: whiistle))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "modal#openAndVisit"
    expect(rendered_content).to match /<a (.|\n)*1(.|\n)*<\/a>/
    expect(rendered_content).to match /reply_counter_whiistle_\d+/
  end
end
