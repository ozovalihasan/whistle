# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FormBody::Component, type: :component do
  before(:each) do
    FactoryBot.reload
  end

  let(:expect_mandatory_elements) do
    expect(rendered_content).to include "mock_value"
    expect(rendered_content).to include "mock_label"
    expect(rendered_content).to include 'for="whiistle_body"'
  end
  
  context "if the argument 'open_modal' is false" do
    it "renders correctly" do
      render_inline(
        MockComponents::SimpleForm::Component.new(
          component_class: described_class, 
          form_key: :form, 
          label: "mock_label", 
          value: "mock_value"
        )
      )

      expect(rendered_content).to match_custom_snapshot("with_open_modal-false")
      expect_mandatory_elements
    end
  end
  
  context "if the argument 'open_modal' is true" do
    it "renders correctly" do
      render_inline(
        MockComponents::SimpleForm::Component.new(
          component_class: described_class, 
          form_key: :form, 
          label: "mock_label", 
          value: "mock_value",
          open_modal: true
        )
      )

      expect(rendered_content).to match_custom_snapshot("with_open_modal-true")
      expect_mandatory_elements
      expect(rendered_content).to include 'modal#openAndVisit'
    end
  end
end
