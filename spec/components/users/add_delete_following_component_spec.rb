# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::AddDeleteFollowingComponent, type: :component do
  context "if the current user doesn't follow another user" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      cur_user = FactoryBot.create(:mock_user)
      
      relation = nil

      mock_components([
        Users::DeleteFollowingComponent, 
        Users::AddFollowingComponent
      ])
      
      render_inline(described_class.new(user: user, cur_user: cur_user, relation: nil))

      expect(rendered_content).to match_custom_snapshot("without_relation")  
      expect(rendered_content).to include "Users::AddFollowingComponent(user_id: Integer)"
    end
  end

  context "if the current user follows another user" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      cur_user = FactoryBot.create(:mock_user)
      relation = FactoryBot.create(:mock_relation, following: cur_user, followed: user)
      
      mock_components([
        Users::DeleteFollowingComponent, 
        Users::AddFollowingComponent
      ])
      
      render_inline(described_class.new(user: user, cur_user: cur_user, relation: relation))

      expect(rendered_content).to match_custom_snapshot("with_relation")  
      expect(rendered_content).to include "Users::DeleteFollowingComponent(relation: Relation)"
    end
  end

  context "if another user is the current user" do
    it "renders correctly" do

      user = FactoryBot.create(:mock_user)
      cur_user = user
      relation = nil
      
      mock_components([
        Users::DeleteFollowingComponent, 
        Users::AddFollowingComponent
      ])
      
      render_inline(described_class.new(user: user, cur_user: cur_user, relation: relation))

      expect(rendered_content).to match_custom_snapshot("self")  
      expect(rendered_content).to be_empty
    end
  end
end
