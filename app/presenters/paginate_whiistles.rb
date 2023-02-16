class PaginateWhiistles < PaginateRecords
  attr_reader :type
  attr_accessor :partial_name
  
  def initialize(original_records, page, url, type = nil)
    super(original_records, page, url)

    @type = type
  end
  
  
  
  def set_for_whiistles_index_page
    self.partial_name = Whiistles::ListWhiistlesForWhiistlesIndexPageComponent
  end

  def set_basic
    self.partial_name = Whiistles::ListWhiistlesComponent
  end

  def set_connected
    self.partial_name = Whiistles::ListWhiistlesWithRelatedWhiistlesComponent
  end
end