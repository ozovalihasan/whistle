# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::FormOpeningModal::Component, type: :component do

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(cur_user)
  end
  
  context "if value is given" do
    it "renders correctly" do
      render_inline(described_class.new(label: "mock_label", whiistle: Whiistle.new, path: "mock_path", current_user_presenter: current_user_presenter, value: "mock_value"))

      expect(rendered_content).to match_custom_snapshot("with_value")  
      expect(rendered_content).to include "Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, current_user_presenter: CurrentUserPresenter, value: String, open_modal: TrueClass, modal_path: String)"
    end
  end

  context "if value is given" do
    it "renders correctly" do

      render_inline(described_class.new(label: "mock_label", whiistle: Whiistle.new, path: "mock_path", current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_custom_snapshot("without_value")  
      expect(rendered_content).to include "Whiistles::Form::Component(form_url: String, whiistle: Whiistle, label: String, current_user_presenter: CurrentUserPresenter, value: NilClass, open_modal: TrueClass, modal_path: String)"
      
    end
  end

end
