# frozen_string_literal: true

class Users::Tabs::Component < Application::Component
  include WhiistlesHelper
  include Turbo::FramesHelper
  
  def initialize(tab_presenter:, sidebar_right_presenter:)
    @tab_presenter = tab_presenter
    @paginate_records = tab_presenter.paginate_records
    @user = tab_presenter.user
    @selected_tab = tab_presenter.name

    @sidebar_right_presenter = sidebar_right_presenter
  end

  def tab_body
    if @paginate_records.class == PaginateWhiistles
      component(
        "users/whiistles_tab", 
        tab_presenter: @tab_presenter
      ) 
    elsif @paginate_records.class == PaginateUsers
      component(
        "users/users_having_relations", 
        tab_presenter: @tab_presenter
      )
    end
    
  end
end
