class PaginateWhiistles < PaginateRecords
  attr_reader :current_user_presenter
  attr_accessor :component_class
  
  def initialize(original_records, page, url, cur_user)
    super(original_records, page, url)
    
    @current_user_presenter = CurrentUserPresenter.new(cur_user)
  end
  
  def set_for_whiistles_index_page
    self.component_class = Whiistles::ListWhiistlesForWhiistlesIndexPage::Component
  end

  def set_basic
    self.component_class = Whiistles::ListWhiistles::Component
  end

  def set_connected
    self.component_class = Whiistles::ListWhiistlesWithRelatedWhiistles::Component
  end
end