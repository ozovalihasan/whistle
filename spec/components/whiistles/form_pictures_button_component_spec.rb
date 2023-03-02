# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FormPicturesButtonComponent, type: :component do
  it "renders correctly" do
    render_inline(MockComponents::SimpleFormComponent.new(component_class: described_class, form_key: :form))

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to include "whiistle_pictures"
    expect(rendered_content).to include 'multiple="multiple" type="file" name="whiistle[pictures][]"'
    expect(rendered_content).to include 'id="whiistle_pictures"'

  end
end
