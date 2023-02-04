# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::DeleteFollowingComponent, type: :component do
  it "renders correctly" do

    FactoryBot.create_pair(:mock_user)
    relation = FactoryBot.create(:mock_relation)
    
    
    render_inline(described_class.new(relation: relation))

    expect(rendered_content).to match_snapshot('DeleteFollowingComponent')  
    expect(rendered_content).to match(/button(.|\n)*bi-x(.|\n)*button/)

  end
end
