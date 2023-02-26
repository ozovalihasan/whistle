# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FormComponent, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::FormPicturesButtonComponent,
      Whiistles::FloodWhiistleFormComponent
    ])
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(user)
  end
  
  context "if any optional parameter isn't provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label"
        ))

      expect(rendered_content).to match_snapshot('FormComponent_default_arguments')
      expect(rendered_content).to include 'for="whiistle_body"'
      expect(rendered_content).to include "mock_label"
      expect(rendered_content).to include "Whiistles::FormPicturesButtonComponent(form: SimpleForm::FormBuilder)"
    end
    
  end

  context "if a value is provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          value: "mock_value"
        ))

      expect(rendered_content).to match_snapshot('FormComponent_with_value')
      expect(rendered_content).to match /textarea(.|\n)*mock_value(.|\n)*textarea/

    end
  end

  context "if a quoted whiistle is provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          quoted_whiistle: quoted_whiistle
        ))

      expect(rendered_content).to match_snapshot('FormComponent_with_quoted_whiistle')
      expect(rendered_content).to match /input class=".*hidden" value="http:\/\/test.host\/whiistles\/\d+"/
    end
  end

  context "if the parameter 'enable_quoting_whiistle' is provided as true" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          enable_quoting_whiistle: true
        ))

      expect(rendered_content).to match_snapshot('FormComponent_with_enable_quoting_whiistle-true')
      expect(rendered_content).to match /input.*id="whiistle_quoted_whiistle_url"/
    end
  end

  context "if the parameter 'open_modal' is provided as true" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          open_modal: true
        ))

      expect(rendered_content).to match_snapshot('FormComponent_with_open_modal-true')
      expect(rendered_content).not_to include "Whiistles::FormPicturesButtonComponent(form: SimpleForm::FormBuilder)"
    end
  end

  context "if the parameter 'enable_adding_floods' is provided as true and the parameter 'enable_modal' is false" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          enable_adding_floods: true
        ))

      expect(rendered_content).to match_snapshot('FormComponent_with_enable_adding_floods-true')
      expect(rendered_content).to include "Whiistles::FloodWhiistleFormComponent(main_form: SimpleForm::FormBuilder)"
      expect(rendered_content).to include "Add Flood"
    end
  end
end
