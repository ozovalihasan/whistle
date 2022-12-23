class PaginateWhiistles < ApplicationService
  include Pagy::Backend
  attr_reader :whiistles, :page
  
  def initialize(whiistles, page)
    @whiistles = whiistles
    @page = page
    
  end

  def call
    pagy_whiistles
  end

  def pagy_whiistles
    pagy, limited_whiistles = pagy(whiistles, page: page)
    last_page = pagy.last

    return [ limited_whiistles, last_page ]
  end
end