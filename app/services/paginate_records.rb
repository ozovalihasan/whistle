class PaginateRecords < ApplicationService
  include Pagy::Backend
  attr_reader :original_records, :records, :page, :last_page, :url
  
  def initialize(original_records, page, url)
    @original_records = original_records
    @page = page ? page : 1
    @url = url
    pagy_records
  end

  def pagy_records
    pagy, @records = pagy(original_records, page: page)
    @last_page = pagy.last
  end
  
end