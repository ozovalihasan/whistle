require 'rails_helper'

RSpec.describe "whiistles/pictures/index", type: :view do
  
  describe "renders the index view of Whiistles::PicturesController" do
    it "renders correctly" do
      FactoryBot.create(:mock_user)
      whiistle = FactoryBot.create(:mock_whiistle)
      whiistle.pictures.attach(
        [
          io: File.open(Rails.root.join('app', 'assets', 'images', 'mock-1.jpg')), 
          filename: 'mock-1.jpg', 
          content_type: 'image/jpeg'
        ]
      )
      whiistle.pictures.attach(
        [
          io: File.open(Rails.root.join('app', 'assets', 'images', 'mock-2.jpg')), 
          filename: 'mock-2.jpg', 
          content_type: 'image/jpeg'
        ]
      )
      
      pictures = whiistle.pictures
      assign(:pictures, pictures)

      index = 1
      assign(:index, index)

      render 

      expect_snapshot_match
      expect(rendered).to include('turbo-frame id="modal_body"')
      expect(rendered).to include('data-controller="tabs"').exactly(1).times
      expect(rendered).to include('data-tabs-index="1"')
      expect(rendered).to include('data-action="click->tabs#previous"').exactly(1).times
      expect(rendered).to include('data-action="click->tabs#next"').exactly(1).times
      expect(rendered).to include('data-action="mouseover->tabs#change"').exactly(2).times
      expect(rendered).to include('data-tabs-target="tab"').exactly(2).times
      expect(rendered).to include('data-tabs-target="panel"').exactly(2).times
      
    end
  end

end
