# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shared::ModalComponent, type: :component do
  it "renders correctly" do

    render_inline(described_class.new) { "mock_content" }

    expect(rendered_content).to match_snapshot('ModalComponent')  
    expect(rendered_content).to include "mock_content"
    expect(rendered_content).to include 'data-controller="modal"'
    expect(rendered_content).to include '<turbo-frame id=modal_body >'
    expect(rendered_content).to include 'data-action="click->modal#closeBackground keyup@window->modal#closeWithKeyboard"'
    expect(rendered_content).to include 'data-modal-allow-background-close="true"'
  end
end
