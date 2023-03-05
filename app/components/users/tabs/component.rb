# frozen_string_literal: true

class Users::Tabs::Component < Application::Component
  include WhiistlesHelper
  include Turbo::FramesHelper
  
  def initialize(tab_presenter:, sidebar_right_presenter:)
    @tab_presenter = tab_presenter
    @paginated_records = tab_presenter.paginated_records
    @user = tab_presenter.user
    @selected_tab = tab_presenter.name

    @sidebar_right_presenter = sidebar_right_presenter
  end

  def tab_body
    if @paginated_records.class == PaginateWhiistles
      Users::WhiistlesTab::Component.new(
        tab_presenter: @tab_presenter
      ) 
    elsif @paginated_records.class == PaginateUsers
      Users::UsersHavingRelations::Component.new(
        tab_presenter: @tab_presenter
      )
    end
    
  end
end
