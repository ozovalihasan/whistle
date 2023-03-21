# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::FormPicturesButton::Component, type: :component do
  it 'renders correctly' do
    render_inline(component('mock_components/simple_form', component_class: described_class, form_key: :form))

    expect_snapshot_match
    expect(rendered_content).to include 'whiistle_pictures'
    expect(rendered_content).to include 'multiple="multiple" type="file" name="whiistle[pictures][]"'
    expect(rendered_content).to include 'id="whiistle_pictures"'
  end
end
