require 'rails_helper'

RSpec.describe "relations/destroy.turbo_stream", type: :view do
  
  before(:each) do
    FactoryBot.create_pair(:mock_user)
    FactoryBot.create(:mock_relation)
  end
  
  describe "renders the destroy turbo stream view of RelationsController" do
    it "renders turbo_streams correctly if the relation is destroyed" do
      relation = Relation.first
      relation.destroy
      flash[:notice] = "The relation is destroyed"
      assign(:relation, relation)

      render 
      
      expect(rendered).to match(flash[:notice])
      expect(rendered).to match_snapshot('destroy')  
    end
  end


end
