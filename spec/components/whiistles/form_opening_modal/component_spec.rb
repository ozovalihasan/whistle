# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FormOpeningModal::Component, type: :component do

  let(:cur_user) do
    FactoryBot.create(:mock_user)
  end
  
  context "if value is given" do
    it "renders correctly" do
      render_inline(described_class.new(label: "mock_label", whiistle: Whiistle.new, path: "mock_path", cur_user: cur_user, value: "mock_value"))

      expect_snapshot_match("with_value")  
      expect(rendered_content).to include "Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, value: String, open_modal: TrueClass, modal_path: String)"
      expect(rendered_content).to include("::Component").exactly(1).times
    end
  end

  context "if value is given" do
    it "renders correctly" do

      render_inline(described_class.new(label: "mock_label", whiistle: Whiistle.new, path: "mock_path", cur_user: cur_user))

      expect_snapshot_match("without_value")  
      expect(rendered_content).to include "Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, cur_user: User, value: NilClass, open_modal: TrueClass, modal_path: String)"
      expect(rendered_content).to include("::Component").exactly(1).times
    end
  end

end
