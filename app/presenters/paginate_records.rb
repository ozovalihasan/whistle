class PaginateRecords
  include Pagy::Backend
  attr_accessor :records, :last_page
  attr_reader :original_records, :page, :url
  
  def initialize(original_records, page, url)
    @original_records = original_records
    @page = page ? page : 1
    @url = url
    pagy_records
  end

  def pagy_records
    pagy, self.records = pagy(original_records, page: page)
    self.last_page = pagy.last
  end
 
end