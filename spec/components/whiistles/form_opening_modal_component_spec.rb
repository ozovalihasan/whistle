# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FormOpeningModalComponent, type: :component do
  context "if value is given" do
    it "renders correctly" do

      mock_components([
        Whiistles::FormBodyComponent
      ])

      render_inline(described_class.new(label: "mock_label", whiistle: Whiistle.new, path: "mock_path", value: "mock_value"))

      expect(rendered_content).to match_custom_snapshot("with_value")  
      expect(rendered_content).to include "Whiistles::FormBodyComponent(form: SimpleForm::FormBuilder, label: String, value: String, open_modal: TrueClass, path: String)"
      expect(rendered_content).to include "mock_path"
      expect(rendered_content).to include 'data-modal-target="defaultAnchor"'
      expect(rendered_content).to include 'data-turbo-frame="modal_body"'
    end
  end

  context "if value is given" do
    it "renders correctly" do

      mock_components([
        Whiistles::FormBodyComponent
      ])

      render_inline(described_class.new(label: "mock_label", whiistle: Whiistle.new, path: "mock_path"))

      expect(rendered_content).to match_custom_snapshot("without_value")  
      expect(rendered_content).to include "Whiistles::FormBodyComponent(form: SimpleForm::FormBuilder, label: String, value: NilClass, open_modal: TrueClass, path: String)"
      
    end
  end

end
