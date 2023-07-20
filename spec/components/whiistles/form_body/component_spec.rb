# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Whiistles::FormBody::Component, type: :component do
  let(:expect_mandatory_elements) do
    expect(rendered_content).to include 'mock_value'
    expect(rendered_content).to include 'mock_label'
    expect(rendered_content).to include 'for="whiistle_body"'
  end

  context "if the argument 'open_modal' is false" do
    it 'renders correctly' do
      render_inline(
        component(
          'mock_components/simple_form',
          component_class: described_class,
          form_key: :form,
          label: 'mock_label',
          value: 'mock_value'
        )
      )

      expect_snapshot_match('with_open_modal-false')
      expect_mandatory_elements
    end
  end

  context "if the argument 'open_modal' is true" do
    it 'renders correctly' do
      render_inline(
        component(
          'mock_components/simple_form',
          component_class: described_class,
          form_key: :form,
          label: 'mock_label',
          value: 'mock_value',
          open_modal: true
        )
      )

      expect_snapshot_match('with_open_modal-true')
      expect_mandatory_elements
      expect(rendered_content).to include 'modal#openAndVisit'
    end
  end
end
