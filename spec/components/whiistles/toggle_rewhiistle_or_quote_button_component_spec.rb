# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ToggleRewhiistleOrQuoteButtonComponent, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::ToggleRewhiistleButtonComponent,
      Whiistles::QuotedWhiistleButtonComponent,
      Whiistles::DestroyRewhiistleOrQuoteButtonComponent,
      Whiistles::CreateRewhiistleOrQuoteButtonComponent
    ])
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:cur_user) do
    FactoryBot.create(:mock_user)
  end
  
  let(:current_user_presenter) do
    CurrentUserPresenter.new(cur_user)
  end

  let(:whiistle) do
    FactoryBot.create(:mock_whiistle, user: user)
  end
  
  it "renders correctly" do
    render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

    expect(rendered_content).to match_snapshot('ToggleRewhiistleOrQuoteButtonComponent')
    expect(rendered_content).to include "Whiistles::ToggleRewhiistleButtonComponent(whiistle: Whiistle, current_user_presenter: CurrentUserPresenter)"
    expect(rendered_content).to include "Whiistles::QuotedWhiistleButtonComponent(whiistle: Whiistle)"
    expect(rendered_content).to include("click->dropdown#toggle").exactly(2).times
    expect(rendered_content).to include "click@window->dropdown#hide"
    expect(rendered_content).to match /rewhiistle_or_quote_button_whiistle_\d+/
    
  end

  context "if the whiistle is rewhiistled by the current user" do
    it "renders correctly" do
      FactoryBot.create(:mock_rewhiistle, whiistle: whiistle, user: cur_user)
      
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_snapshot('ToggleRewhiistleOrQuoteButtonComponent_rewhiistled')
      expect(rendered_content).to include "Whiistles::DestroyRewhiistleOrQuoteButtonComponent(whiistle: Whiistle)"
    end
  end

  context "if the whiistle is not rewhiistled by the current user" do
    it "renders correctly" do
      
      render_inline(described_class.new(whiistle: whiistle, current_user_presenter: current_user_presenter))

      expect(rendered_content).to match_snapshot('ToggleRewhiistleOrQuoteButtonComponent_not_rewhiistled')
      expect(rendered_content).to include "Whiistles::CreateRewhiistleOrQuoteButtonComponent(whiistle: Whiistle)"
    end
  end
end
