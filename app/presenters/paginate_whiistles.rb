class PaginateWhiistles < PaginateRecords
  attr_reader :type
  attr_accessor :component_class
  
  def initialize(original_records, page, url)
    super(original_records, page, url)
  end
  
  def set_for_whiistles_index_page
    self.component_class = Whiistles::ListWhiistlesForWhiistlesIndexPageComponent
  end

  def set_basic
    self.component_class = Whiistles::ListWhiistlesComponent
  end

  def set_connected
    self.component_class = Whiistles::ListWhiistlesWithRelatedWhiistlesComponent
  end
end