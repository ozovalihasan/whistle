# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::WhiistlesTab::Component, type: :component do
  before(:each) do
    FactoryBot.reload
    
    mock_components([
      Whiistles::FormOpeningModal::Component,
      Users::PaginatedWhiistles::Component
    ])
  end

  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(cur_user)
  end

  let(:paginated_whiistles) do
     PaginateWhiistles.new(Whiistle.all, 1, "mock_url")
  end
  
  context "if there is a whiistle to show" do
    it "renders correctly" do
      
      user
      FactoryBot.create(:mock_whiistle)

      tab_presenter = WhiistlesTabPresenter.new(user, :whiistles_without_replies, paginated_whiistles, current_user_presenter, Whiistle.new)
      
      render_inline(described_class.new( tab_presenter: tab_presenter ))

      expect(rendered_content).to match_custom_snapshot("with_whiistles")
      expect(rendered_content).to include("Users::PaginatedWhiistles::Component(paginated_whiistles: PaginateWhiistles, current_user_presenter: CurrentUserPresenter)")
    end
  end

  context "if there is no any whiistle to show" do
    it "renders correctly" do
      tab_presenter = WhiistlesTabPresenter.new(user, :whiistles_without_replies, paginated_whiistles, current_user_presenter, Whiistle.new)
      
      render_inline(described_class.new( tab_presenter: tab_presenter ))

      expect(rendered_content).to match_custom_snapshot("without_whiistles")
      expect(rendered_content).to include("mock_fullname_1 doesn&#39;t have any whiistle to show.")
    end
  end

  context "if there is a form for a new whiistle" do
    it "renders correctly" do
      tab_presenter = WhiistlesTabPresenter.new(user, :whiistles_without_replies, paginated_whiistles, current_user_presenter, Whiistle.new)
      
      render_inline(described_class.new( tab_presenter: tab_presenter ))

      expect(rendered_content).to match_custom_snapshot("with_whiistle_form")
      expect(rendered_content).to include("Whiistles::FormOpeningModal::Component(label: String, value: String, whiistle: Whiistle, path: String)")
    end
  end

  context "if there isn't any form for a new whiistle" do
    it "renders correctly" do
      tab_presenter = WhiistlesTabPresenter.new(user, :whiistles_without_replies, paginated_whiistles, current_user_presenter)
      
      render_inline(described_class.new( tab_presenter: tab_presenter ))

      expect(rendered_content).to match_custom_snapshot("without_whiistle_form")
      expect(rendered_content).not_to include("Whiistles::FormOpeningModal::Component(label: String, value: String, whiistle: Whiistle, path: String)")
    end
  end

end
