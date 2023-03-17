# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FloodWhiistleForm::Component, type: :component do
  it "renders correctly" do
    
    render_inline(component("mock_components/simple_form", component_class: described_class, form_key: :main_form))

    expect_snapshot_match
    expect(rendered_content).to include 'whiistle_floods_TEMPLATE_RECORD_body'
    expect(rendered_content).to include 'whiistle_floods_TEMPLATE_RECORD_quoted_whiistle_url'
    expect(rendered_content).to include 'Whiistles::FormPicturesButton::Component(form: SimpleForm::FormBuilder)'
    expect(rendered_content).to include 'Quoted whiistle url'
    expect(rendered_content).to include 'Add Flood'
    expect(rendered_content).to include 'type="submit"'
    expect(rendered_content).to include("::Component").exactly(1).times
  end
end
