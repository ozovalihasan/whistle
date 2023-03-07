# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FloodWhiistleForm::Component, type: :component do
  it "renders correctly" do
    
    render_inline(MockComponents::SimpleForm::Component.new(component_class: described_class, form_key: :main_form))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include 'whiistle_floods_TEMPLATE_RECORD_body'
    expect(rendered_content).to include 'whiistle_floods_TEMPLATE_RECORD_pictures'
    expect(rendered_content).to include 'whiistle_floods_TEMPLATE_RECORD_quoted_whiistle_url'
    expect(rendered_content).to include 'Quoted whiistle url'
    expect(rendered_content).to include 'Add Flood'
    expect(rendered_content).to include 'type="submit"'

  end
end