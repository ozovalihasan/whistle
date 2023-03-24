# frozen_string_literal: true

class PaginateWhiistles < PaginateRecords
  attr_reader :current_user_presenter
  attr_accessor :component_name

  def initialize(original_records, page, url, cur_user)
    original_records = original_records.includes(user: [{ profile_picture_attachment: :blob }])
    super(original_records, page, url)

    @current_user_presenter = CurrentUserPresenter.new(cur_user)
  end

  def set_for_whiistles_index_page
    self.component_name = 'whiistles/list_whiistles_for_whiistles_index_page'
  end

  def set_basic
    self.component_name = 'whiistles/list_whiistles'
  end

  def set_connected
    self.component_name = 'whiistles/list_whiistles_with_related_whiistles'
  end
end
