class PaginateWhiistles < PaginateRecords
  attr_accessor :partial_name
  
  def set_for_whiistles_index_page
    self.partial_name = "whiistles/list_whiistles_for_whiistles_index_page"
  end

  def set_basic
    self.partial_name = "whiistles/list_whiistles"
  end

  def set_connected
    self.partial_name = "whiistles/list_whiistles_with_related_whiistles"
  end
end