require 'rails_helper'

RSpec.describe "relations/create", type: :view do
  
  before(:each) do
    FactoryBot.create_pair(:mock_user)
  end
  
  describe "renders the create turbo stream view of RelationsController" do
    it "renders turbo_streams correctly if the relation is saved" do
      relation = FactoryBot.build(:mock_relation)
      flash[:notice] = "The relation is saved" if relation.save
      assign(:relation, relation)

      render 
      
      expect(rendered).to match_snapshot('create/successful')  
    end

    it "renders turbo_streams correctly if the relation is not saved" do
      relation = FactoryBot.build(:mock_relation, followed_id: User.last.id + 1)
      flash[:alert] = "The relation is not saved" unless relation.save
      assign(:relation, relation)

      render 

      expect(rendered).to match_snapshot('create/fail')  
    end
  end

end